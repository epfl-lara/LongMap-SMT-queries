; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68352 () Bool)

(assert start!68352)

(declare-fun b!794175 () Bool)

(declare-fun e!441023 () Bool)

(declare-fun e!441025 () Bool)

(assert (=> b!794175 (= e!441023 e!441025)))

(declare-fun res!538697 () Bool)

(assert (=> b!794175 (=> (not res!538697) (not e!441025))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354016 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43142 0))(
  ( (array!43143 (arr!20651 (Array (_ BitVec 32) (_ BitVec 64))) (size!21072 (_ BitVec 32))) )
))
(declare-fun lt!354017 () array!43142)

(declare-datatypes ((SeekEntryResult!8242 0))(
  ( (MissingZero!8242 (index!35336 (_ BitVec 32))) (Found!8242 (index!35337 (_ BitVec 32))) (Intermediate!8242 (undefined!9054 Bool) (index!35338 (_ BitVec 32)) (x!66264 (_ BitVec 32))) (Undefined!8242) (MissingVacant!8242 (index!35339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43142 (_ BitVec 32)) SeekEntryResult!8242)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43142 (_ BitVec 32)) SeekEntryResult!8242)

(assert (=> b!794175 (= res!538697 (= (seekEntryOrOpen!0 lt!354016 lt!354017 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354016 lt!354017 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43142)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794175 (= lt!354016 (select (store (arr!20651 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794175 (= lt!354017 (array!43143 (store (arr!20651 a!3170) i!1163 k!2044) (size!21072 a!3170)))))

(declare-fun b!794176 () Bool)

(declare-fun res!538698 () Bool)

(declare-fun e!441024 () Bool)

(assert (=> b!794176 (=> (not res!538698) (not e!441024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794176 (= res!538698 (validKeyInArray!0 (select (arr!20651 a!3170) j!153)))))

(declare-fun b!794177 () Bool)

(declare-fun res!538701 () Bool)

(assert (=> b!794177 (=> (not res!538701) (not e!441024))))

(assert (=> b!794177 (= res!538701 (validKeyInArray!0 k!2044))))

(declare-fun res!538699 () Bool)

(assert (=> start!68352 (=> (not res!538699) (not e!441024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68352 (= res!538699 (validMask!0 mask!3266))))

(assert (=> start!68352 e!441024))

(assert (=> start!68352 true))

(declare-fun array_inv!16447 (array!43142) Bool)

(assert (=> start!68352 (array_inv!16447 a!3170)))

(declare-fun b!794178 () Bool)

(declare-fun res!538696 () Bool)

(assert (=> b!794178 (=> (not res!538696) (not e!441023))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794178 (= res!538696 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21072 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20651 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21072 a!3170)) (= (select (arr!20651 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794179 () Bool)

(declare-fun res!538695 () Bool)

(assert (=> b!794179 (=> (not res!538695) (not e!441023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43142 (_ BitVec 32)) Bool)

(assert (=> b!794179 (= res!538695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794180 () Bool)

(assert (=> b!794180 (= e!441024 e!441023)))

(declare-fun res!538700 () Bool)

(assert (=> b!794180 (=> (not res!538700) (not e!441023))))

(declare-fun lt!354015 () SeekEntryResult!8242)

(assert (=> b!794180 (= res!538700 (or (= lt!354015 (MissingZero!8242 i!1163)) (= lt!354015 (MissingVacant!8242 i!1163))))))

(assert (=> b!794180 (= lt!354015 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794181 () Bool)

(declare-fun res!538694 () Bool)

(assert (=> b!794181 (=> (not res!538694) (not e!441024))))

(assert (=> b!794181 (= res!538694 (and (= (size!21072 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21072 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21072 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794182 () Bool)

(assert (=> b!794182 (= e!441025 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!794183 () Bool)

(declare-fun res!538702 () Bool)

(assert (=> b!794183 (=> (not res!538702) (not e!441024))))

(declare-fun arrayContainsKey!0 (array!43142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794183 (= res!538702 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794184 () Bool)

(declare-fun res!538703 () Bool)

(assert (=> b!794184 (=> (not res!538703) (not e!441023))))

(declare-datatypes ((List!14614 0))(
  ( (Nil!14611) (Cons!14610 (h!15739 (_ BitVec 64)) (t!20929 List!14614)) )
))
(declare-fun arrayNoDuplicates!0 (array!43142 (_ BitVec 32) List!14614) Bool)

(assert (=> b!794184 (= res!538703 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14611))))

(assert (= (and start!68352 res!538699) b!794181))

(assert (= (and b!794181 res!538694) b!794176))

(assert (= (and b!794176 res!538698) b!794177))

(assert (= (and b!794177 res!538701) b!794183))

(assert (= (and b!794183 res!538702) b!794180))

(assert (= (and b!794180 res!538700) b!794179))

(assert (= (and b!794179 res!538695) b!794184))

(assert (= (and b!794184 res!538703) b!794178))

(assert (= (and b!794178 res!538696) b!794175))

(assert (= (and b!794175 res!538697) b!794182))

(declare-fun m!734693 () Bool)

(assert (=> start!68352 m!734693))

(declare-fun m!734695 () Bool)

(assert (=> start!68352 m!734695))

(declare-fun m!734697 () Bool)

(assert (=> b!794177 m!734697))

(declare-fun m!734699 () Bool)

(assert (=> b!794184 m!734699))

(declare-fun m!734701 () Bool)

(assert (=> b!794178 m!734701))

(declare-fun m!734703 () Bool)

(assert (=> b!794178 m!734703))

(declare-fun m!734705 () Bool)

(assert (=> b!794175 m!734705))

(declare-fun m!734707 () Bool)

(assert (=> b!794175 m!734707))

(declare-fun m!734709 () Bool)

(assert (=> b!794175 m!734709))

(declare-fun m!734711 () Bool)

(assert (=> b!794175 m!734711))

(declare-fun m!734713 () Bool)

(assert (=> b!794180 m!734713))

(declare-fun m!734715 () Bool)

(assert (=> b!794179 m!734715))

(declare-fun m!734717 () Bool)

(assert (=> b!794183 m!734717))

(declare-fun m!734719 () Bool)

(assert (=> b!794176 m!734719))

(assert (=> b!794176 m!734719))

(declare-fun m!734721 () Bool)

(assert (=> b!794176 m!734721))

(push 1)

(assert (not b!794180))

(assert (not b!794183))

(assert (not start!68352))

(assert (not b!794177))

(assert (not b!794176))

(assert (not b!794179))

(assert (not b!794184))

(assert (not b!794175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

