; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44602 () Bool)

(assert start!44602)

(declare-fun b!489210 () Bool)

(declare-fun e!287755 () Bool)

(declare-fun e!287754 () Bool)

(assert (=> b!489210 (= e!287755 e!287754)))

(declare-fun res!292151 () Bool)

(assert (=> b!489210 (=> (not res!292151) (not e!287754))))

(declare-datatypes ((SeekEntryResult!3685 0))(
  ( (MissingZero!3685 (index!16919 (_ BitVec 32))) (Found!3685 (index!16920 (_ BitVec 32))) (Intermediate!3685 (undefined!4497 Bool) (index!16921 (_ BitVec 32)) (x!46031 (_ BitVec 32))) (Undefined!3685) (MissingVacant!3685 (index!16922 (_ BitVec 32))) )
))
(declare-fun lt!220710 () SeekEntryResult!3685)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489210 (= res!292151 (or (= lt!220710 (MissingZero!3685 i!1204)) (= lt!220710 (MissingVacant!3685 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31661 0))(
  ( (array!31662 (arr!15218 (Array (_ BitVec 32) (_ BitVec 64))) (size!15582 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31661)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31661 (_ BitVec 32)) SeekEntryResult!3685)

(assert (=> b!489210 (= lt!220710 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!292154 () Bool)

(assert (=> start!44602 (=> (not res!292154) (not e!287755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44602 (= res!292154 (validMask!0 mask!3524))))

(assert (=> start!44602 e!287755))

(assert (=> start!44602 true))

(declare-fun array_inv!11014 (array!31661) Bool)

(assert (=> start!44602 (array_inv!11014 a!3235)))

(declare-fun b!489211 () Bool)

(declare-fun res!292153 () Bool)

(assert (=> b!489211 (=> (not res!292153) (not e!287755))))

(declare-fun arrayContainsKey!0 (array!31661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489211 (= res!292153 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489212 () Bool)

(declare-fun res!292150 () Bool)

(assert (=> b!489212 (=> (not res!292150) (not e!287755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489212 (= res!292150 (validKeyInArray!0 k!2280))))

(declare-fun b!489213 () Bool)

(declare-fun res!292146 () Bool)

(assert (=> b!489213 (=> (not res!292146) (not e!287754))))

(declare-datatypes ((List!9376 0))(
  ( (Nil!9373) (Cons!9372 (h!10234 (_ BitVec 64)) (t!15604 List!9376)) )
))
(declare-fun arrayNoDuplicates!0 (array!31661 (_ BitVec 32) List!9376) Bool)

(assert (=> b!489213 (= res!292146 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9373))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!489214 () Bool)

(declare-fun e!287756 () Bool)

(assert (=> b!489214 (= e!287756 (= (seekEntryOrOpen!0 (select (arr!15218 a!3235) j!176) a!3235 mask!3524) (Found!3685 j!176)))))

(declare-fun b!489215 () Bool)

(declare-fun res!292147 () Bool)

(assert (=> b!489215 (=> (not res!292147) (not e!287755))))

(assert (=> b!489215 (= res!292147 (and (= (size!15582 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15582 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15582 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489216 () Bool)

(declare-fun res!292149 () Bool)

(assert (=> b!489216 (=> (not res!292149) (not e!287754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31661 (_ BitVec 32)) Bool)

(assert (=> b!489216 (= res!292149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489217 () Bool)

(assert (=> b!489217 (= e!287754 (not true))))

(declare-fun lt!220711 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489217 (= lt!220711 (toIndex!0 (select (store (arr!15218 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489217 e!287756))

(declare-fun res!292148 () Bool)

(assert (=> b!489217 (=> (not res!292148) (not e!287756))))

(assert (=> b!489217 (= res!292148 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14316 0))(
  ( (Unit!14317) )
))
(declare-fun lt!220709 () Unit!14316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14316)

(assert (=> b!489217 (= lt!220709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489218 () Bool)

(declare-fun res!292152 () Bool)

(assert (=> b!489218 (=> (not res!292152) (not e!287755))))

(assert (=> b!489218 (= res!292152 (validKeyInArray!0 (select (arr!15218 a!3235) j!176)))))

(assert (= (and start!44602 res!292154) b!489215))

(assert (= (and b!489215 res!292147) b!489218))

(assert (= (and b!489218 res!292152) b!489212))

(assert (= (and b!489212 res!292150) b!489211))

(assert (= (and b!489211 res!292153) b!489210))

(assert (= (and b!489210 res!292151) b!489216))

(assert (= (and b!489216 res!292149) b!489213))

(assert (= (and b!489213 res!292146) b!489217))

(assert (= (and b!489217 res!292148) b!489214))

(declare-fun m!468939 () Bool)

(assert (=> b!489212 m!468939))

(declare-fun m!468941 () Bool)

(assert (=> b!489214 m!468941))

(assert (=> b!489214 m!468941))

(declare-fun m!468943 () Bool)

(assert (=> b!489214 m!468943))

(declare-fun m!468945 () Bool)

(assert (=> b!489216 m!468945))

(declare-fun m!468947 () Bool)

(assert (=> b!489211 m!468947))

(declare-fun m!468949 () Bool)

(assert (=> b!489217 m!468949))

(declare-fun m!468951 () Bool)

(assert (=> b!489217 m!468951))

(declare-fun m!468953 () Bool)

(assert (=> b!489217 m!468953))

(declare-fun m!468955 () Bool)

(assert (=> b!489217 m!468955))

(assert (=> b!489217 m!468953))

(declare-fun m!468957 () Bool)

(assert (=> b!489217 m!468957))

(declare-fun m!468959 () Bool)

(assert (=> start!44602 m!468959))

(declare-fun m!468961 () Bool)

(assert (=> start!44602 m!468961))

(declare-fun m!468963 () Bool)

(assert (=> b!489213 m!468963))

(assert (=> b!489218 m!468941))

(assert (=> b!489218 m!468941))

(declare-fun m!468965 () Bool)

(assert (=> b!489218 m!468965))

(declare-fun m!468967 () Bool)

(assert (=> b!489210 m!468967))

(push 1)

