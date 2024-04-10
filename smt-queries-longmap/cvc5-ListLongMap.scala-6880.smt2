; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86534 () Bool)

(assert start!86534)

(declare-fun b!1002765 () Bool)

(declare-fun e!564879 () Bool)

(declare-fun e!564875 () Bool)

(assert (=> b!1002765 (= e!564879 e!564875)))

(declare-fun res!672250 () Bool)

(assert (=> b!1002765 (=> (not res!672250) (not e!564875))))

(declare-datatypes ((SeekEntryResult!9425 0))(
  ( (MissingZero!9425 (index!40071 (_ BitVec 32))) (Found!9425 (index!40072 (_ BitVec 32))) (Intermediate!9425 (undefined!10237 Bool) (index!40073 (_ BitVec 32)) (x!87485 (_ BitVec 32))) (Undefined!9425) (MissingVacant!9425 (index!40074 (_ BitVec 32))) )
))
(declare-fun lt!443341 () SeekEntryResult!9425)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002765 (= res!672250 (or (= lt!443341 (MissingVacant!9425 i!1194)) (= lt!443341 (MissingZero!9425 i!1194))))))

(declare-datatypes ((array!63335 0))(
  ( (array!63336 (arr!30493 (Array (_ BitVec 32) (_ BitVec 64))) (size!30995 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63335)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63335 (_ BitVec 32)) SeekEntryResult!9425)

(assert (=> b!1002765 (= lt!443341 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002766 () Bool)

(declare-fun res!672247 () Bool)

(assert (=> b!1002766 (=> (not res!672247) (not e!564875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63335 (_ BitVec 32)) Bool)

(assert (=> b!1002766 (= res!672247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!672255 () Bool)

(assert (=> start!86534 (=> (not res!672255) (not e!564879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86534 (= res!672255 (validMask!0 mask!3464))))

(assert (=> start!86534 e!564879))

(declare-fun array_inv!23617 (array!63335) Bool)

(assert (=> start!86534 (array_inv!23617 a!3219)))

(assert (=> start!86534 true))

(declare-fun b!1002767 () Bool)

(declare-fun e!564880 () Bool)

(declare-fun e!564874 () Bool)

(assert (=> b!1002767 (= e!564880 e!564874)))

(declare-fun res!672243 () Bool)

(assert (=> b!1002767 (=> (not res!672243) (not e!564874))))

(declare-fun lt!443338 () array!63335)

(declare-fun lt!443342 () SeekEntryResult!9425)

(declare-fun lt!443345 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63335 (_ BitVec 32)) SeekEntryResult!9425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002767 (= res!672243 (not (= lt!443342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443345 mask!3464) lt!443345 lt!443338 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1002767 (= lt!443345 (select (store (arr!30493 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002767 (= lt!443338 (array!63336 (store (arr!30493 a!3219) i!1194 k!2224) (size!30995 a!3219)))))

(declare-fun b!1002768 () Bool)

(declare-fun res!672251 () Bool)

(declare-fun e!564878 () Bool)

(assert (=> b!1002768 (=> (not res!672251) (not e!564878))))

(declare-fun lt!443344 () SeekEntryResult!9425)

(declare-fun lt!443339 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1002768 (= res!672251 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443339 (select (arr!30493 a!3219) j!170) a!3219 mask!3464) lt!443344))))

(declare-fun b!1002769 () Bool)

(declare-fun e!564876 () Bool)

(assert (=> b!1002769 (= e!564876 e!564880)))

(declare-fun res!672258 () Bool)

(assert (=> b!1002769 (=> (not res!672258) (not e!564880))))

(declare-fun lt!443343 () SeekEntryResult!9425)

(assert (=> b!1002769 (= res!672258 (= lt!443343 lt!443344))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1002769 (= lt!443343 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30493 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002770 () Bool)

(declare-fun res!672257 () Bool)

(assert (=> b!1002770 (=> (not res!672257) (not e!564879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002770 (= res!672257 (validKeyInArray!0 k!2224))))

(declare-fun b!1002771 () Bool)

(declare-fun res!672248 () Bool)

(assert (=> b!1002771 (=> (not res!672248) (not e!564874))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002771 (= res!672248 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002772 () Bool)

(assert (=> b!1002772 (= e!564878 false)))

(declare-fun lt!443340 () SeekEntryResult!9425)

(assert (=> b!1002772 (= lt!443340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443339 lt!443345 lt!443338 mask!3464))))

(declare-fun b!1002773 () Bool)

(declare-fun res!672246 () Bool)

(assert (=> b!1002773 (=> (not res!672246) (not e!564875))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002773 (= res!672246 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30995 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30995 a!3219))))))

(declare-fun b!1002774 () Bool)

(declare-fun res!672249 () Bool)

(assert (=> b!1002774 (=> (not res!672249) (not e!564879))))

(assert (=> b!1002774 (= res!672249 (validKeyInArray!0 (select (arr!30493 a!3219) j!170)))))

(declare-fun b!1002775 () Bool)

(declare-fun res!672252 () Bool)

(assert (=> b!1002775 (=> (not res!672252) (not e!564875))))

(declare-datatypes ((List!21169 0))(
  ( (Nil!21166) (Cons!21165 (h!22342 (_ BitVec 64)) (t!30170 List!21169)) )
))
(declare-fun arrayNoDuplicates!0 (array!63335 (_ BitVec 32) List!21169) Bool)

(assert (=> b!1002775 (= res!672252 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21166))))

(declare-fun b!1002776 () Bool)

(assert (=> b!1002776 (= e!564874 e!564878)))

(declare-fun res!672244 () Bool)

(assert (=> b!1002776 (=> (not res!672244) (not e!564878))))

(assert (=> b!1002776 (= res!672244 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443339 #b00000000000000000000000000000000) (bvslt lt!443339 (size!30995 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002776 (= lt!443339 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002777 () Bool)

(declare-fun res!672256 () Bool)

(assert (=> b!1002777 (=> (not res!672256) (not e!564874))))

(assert (=> b!1002777 (= res!672256 (not (= lt!443343 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443345 lt!443338 mask!3464))))))

(declare-fun b!1002778 () Bool)

(declare-fun res!672253 () Bool)

(assert (=> b!1002778 (=> (not res!672253) (not e!564879))))

(assert (=> b!1002778 (= res!672253 (and (= (size!30995 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30995 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30995 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002779 () Bool)

(declare-fun res!672245 () Bool)

(assert (=> b!1002779 (=> (not res!672245) (not e!564879))))

(declare-fun arrayContainsKey!0 (array!63335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002779 (= res!672245 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002780 () Bool)

(assert (=> b!1002780 (= e!564875 e!564876)))

(declare-fun res!672254 () Bool)

(assert (=> b!1002780 (=> (not res!672254) (not e!564876))))

(assert (=> b!1002780 (= res!672254 (= lt!443342 lt!443344))))

(assert (=> b!1002780 (= lt!443344 (Intermediate!9425 false resIndex!38 resX!38))))

(assert (=> b!1002780 (= lt!443342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30493 a!3219) j!170) mask!3464) (select (arr!30493 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86534 res!672255) b!1002778))

(assert (= (and b!1002778 res!672253) b!1002774))

(assert (= (and b!1002774 res!672249) b!1002770))

(assert (= (and b!1002770 res!672257) b!1002779))

(assert (= (and b!1002779 res!672245) b!1002765))

(assert (= (and b!1002765 res!672250) b!1002766))

(assert (= (and b!1002766 res!672247) b!1002775))

(assert (= (and b!1002775 res!672252) b!1002773))

(assert (= (and b!1002773 res!672246) b!1002780))

(assert (= (and b!1002780 res!672254) b!1002769))

(assert (= (and b!1002769 res!672258) b!1002767))

(assert (= (and b!1002767 res!672243) b!1002777))

(assert (= (and b!1002777 res!672256) b!1002771))

(assert (= (and b!1002771 res!672248) b!1002776))

(assert (= (and b!1002776 res!672244) b!1002768))

(assert (= (and b!1002768 res!672251) b!1002772))

(declare-fun m!928589 () Bool)

(assert (=> b!1002766 m!928589))

(declare-fun m!928591 () Bool)

(assert (=> b!1002765 m!928591))

(declare-fun m!928593 () Bool)

(assert (=> start!86534 m!928593))

(declare-fun m!928595 () Bool)

(assert (=> start!86534 m!928595))

(declare-fun m!928597 () Bool)

(assert (=> b!1002775 m!928597))

(declare-fun m!928599 () Bool)

(assert (=> b!1002779 m!928599))

(declare-fun m!928601 () Bool)

(assert (=> b!1002768 m!928601))

(assert (=> b!1002768 m!928601))

(declare-fun m!928603 () Bool)

(assert (=> b!1002768 m!928603))

(declare-fun m!928605 () Bool)

(assert (=> b!1002770 m!928605))

(declare-fun m!928607 () Bool)

(assert (=> b!1002777 m!928607))

(declare-fun m!928609 () Bool)

(assert (=> b!1002767 m!928609))

(assert (=> b!1002767 m!928609))

(declare-fun m!928611 () Bool)

(assert (=> b!1002767 m!928611))

(declare-fun m!928613 () Bool)

(assert (=> b!1002767 m!928613))

(declare-fun m!928615 () Bool)

(assert (=> b!1002767 m!928615))

(declare-fun m!928617 () Bool)

(assert (=> b!1002776 m!928617))

(assert (=> b!1002769 m!928601))

(assert (=> b!1002769 m!928601))

(declare-fun m!928619 () Bool)

(assert (=> b!1002769 m!928619))

(declare-fun m!928621 () Bool)

(assert (=> b!1002772 m!928621))

(assert (=> b!1002774 m!928601))

(assert (=> b!1002774 m!928601))

(declare-fun m!928623 () Bool)

(assert (=> b!1002774 m!928623))

(assert (=> b!1002780 m!928601))

(assert (=> b!1002780 m!928601))

(declare-fun m!928625 () Bool)

(assert (=> b!1002780 m!928625))

(assert (=> b!1002780 m!928625))

(assert (=> b!1002780 m!928601))

(declare-fun m!928627 () Bool)

(assert (=> b!1002780 m!928627))

(push 1)

(assert (not b!1002777))

(assert (not b!1002779))

(assert (not b!1002775))

(assert (not b!1002767))

(assert (not b!1002772))

(assert (not start!86534))

(assert (not b!1002780))

(assert (not b!1002774))

