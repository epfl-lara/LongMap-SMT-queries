; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28420 () Bool)

(assert start!28420)

(declare-fun b!291001 () Bool)

(declare-fun res!152340 () Bool)

(declare-fun e!184139 () Bool)

(assert (=> b!291001 (=> (not res!152340) (not e!184139))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14689 0))(
  ( (array!14690 (arr!6970 (Array (_ BitVec 32) (_ BitVec 64))) (size!7322 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14689)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291001 (= res!152340 (and (= (size!7322 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7322 a!3312))))))

(declare-fun b!291002 () Bool)

(declare-fun e!184141 () Bool)

(declare-fun e!184142 () Bool)

(assert (=> b!291002 (= e!184141 e!184142)))

(declare-fun res!152341 () Bool)

(assert (=> b!291002 (=> (not res!152341) (not e!184142))))

(declare-datatypes ((SeekEntryResult!2119 0))(
  ( (MissingZero!2119 (index!10646 (_ BitVec 32))) (Found!2119 (index!10647 (_ BitVec 32))) (Intermediate!2119 (undefined!2931 Bool) (index!10648 (_ BitVec 32)) (x!28834 (_ BitVec 32))) (Undefined!2119) (MissingVacant!2119 (index!10649 (_ BitVec 32))) )
))
(declare-fun lt!143869 () SeekEntryResult!2119)

(declare-fun lt!143866 () Bool)

(assert (=> b!291002 (= res!152341 (and (not lt!143866) (= lt!143869 (MissingVacant!2119 i!1256))))))

(declare-fun lt!143868 () (_ BitVec 32))

(declare-fun lt!143867 () SeekEntryResult!2119)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14689 (_ BitVec 32)) SeekEntryResult!2119)

(assert (=> b!291002 (= lt!143867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143868 k!2524 (array!14690 (store (arr!6970 a!3312) i!1256 k!2524) (size!7322 a!3312)) mask!3809))))

(declare-fun lt!143864 () SeekEntryResult!2119)

(assert (=> b!291002 (= lt!143864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143868 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291002 (= lt!143868 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291003 () Bool)

(assert (=> b!291003 (= e!184139 e!184141)))

(declare-fun res!152343 () Bool)

(assert (=> b!291003 (=> (not res!152343) (not e!184141))))

(assert (=> b!291003 (= res!152343 (or lt!143866 (= lt!143869 (MissingVacant!2119 i!1256))))))

(assert (=> b!291003 (= lt!143866 (= lt!143869 (MissingZero!2119 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14689 (_ BitVec 32)) SeekEntryResult!2119)

(assert (=> b!291003 (= lt!143869 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291004 () Bool)

(declare-fun res!152345 () Bool)

(assert (=> b!291004 (=> (not res!152345) (not e!184141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14689 (_ BitVec 32)) Bool)

(assert (=> b!291004 (= res!152345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152344 () Bool)

(assert (=> start!28420 (=> (not res!152344) (not e!184139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28420 (= res!152344 (validMask!0 mask!3809))))

(assert (=> start!28420 e!184139))

(assert (=> start!28420 true))

(declare-fun array_inv!4933 (array!14689) Bool)

(assert (=> start!28420 (array_inv!4933 a!3312)))

(declare-fun b!291005 () Bool)

(declare-fun e!184138 () Bool)

(assert (=> b!291005 (= e!184142 e!184138)))

(declare-fun res!152339 () Bool)

(assert (=> b!291005 (=> (not res!152339) (not e!184138))))

(declare-fun lt!143865 () Bool)

(assert (=> b!291005 (= res!152339 (and (or lt!143865 (not (undefined!2931 lt!143864))) (not lt!143865) (= (select (arr!6970 a!3312) (index!10648 lt!143864)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291005 (= lt!143865 (not (is-Intermediate!2119 lt!143864)))))

(declare-fun b!291006 () Bool)

(declare-fun res!152346 () Bool)

(assert (=> b!291006 (=> (not res!152346) (not e!184139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291006 (= res!152346 (validKeyInArray!0 k!2524))))

(declare-fun b!291007 () Bool)

(assert (=> b!291007 (= e!184138 (not true))))

(assert (=> b!291007 (= (index!10648 lt!143864) i!1256)))

(declare-fun b!291008 () Bool)

(declare-fun res!152342 () Bool)

(assert (=> b!291008 (=> (not res!152342) (not e!184139))))

(declare-fun arrayContainsKey!0 (array!14689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291008 (= res!152342 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28420 res!152344) b!291001))

(assert (= (and b!291001 res!152340) b!291006))

(assert (= (and b!291006 res!152346) b!291008))

(assert (= (and b!291008 res!152342) b!291003))

(assert (= (and b!291003 res!152343) b!291004))

(assert (= (and b!291004 res!152345) b!291002))

(assert (= (and b!291002 res!152341) b!291005))

(assert (= (and b!291005 res!152339) b!291007))

(declare-fun m!304973 () Bool)

(assert (=> start!28420 m!304973))

(declare-fun m!304975 () Bool)

(assert (=> start!28420 m!304975))

(declare-fun m!304977 () Bool)

(assert (=> b!291006 m!304977))

(declare-fun m!304979 () Bool)

(assert (=> b!291003 m!304979))

(declare-fun m!304981 () Bool)

(assert (=> b!291002 m!304981))

(declare-fun m!304983 () Bool)

(assert (=> b!291002 m!304983))

(declare-fun m!304985 () Bool)

(assert (=> b!291002 m!304985))

(declare-fun m!304987 () Bool)

(assert (=> b!291002 m!304987))

(declare-fun m!304989 () Bool)

(assert (=> b!291005 m!304989))

(declare-fun m!304991 () Bool)

(assert (=> b!291004 m!304991))

(declare-fun m!304993 () Bool)

(assert (=> b!291008 m!304993))

(push 1)

