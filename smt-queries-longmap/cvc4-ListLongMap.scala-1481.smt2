; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28276 () Bool)

(assert start!28276)

(declare-fun b!289774 () Bool)

(declare-datatypes ((Unit!9135 0))(
  ( (Unit!9136) )
))
(declare-fun e!183430 () Unit!9135)

(declare-fun e!183431 () Unit!9135)

(assert (=> b!289774 (= e!183430 e!183431)))

(declare-fun c!46821 () Bool)

(declare-datatypes ((SeekEntryResult!2071 0))(
  ( (MissingZero!2071 (index!10454 (_ BitVec 32))) (Found!2071 (index!10455 (_ BitVec 32))) (Intermediate!2071 (undefined!2883 Bool) (index!10456 (_ BitVec 32)) (x!28652 (_ BitVec 32))) (Undefined!2071) (MissingVacant!2071 (index!10457 (_ BitVec 32))) )
))
(declare-fun lt!143041 () SeekEntryResult!2071)

(assert (=> b!289774 (= c!46821 (is-Intermediate!2071 lt!143041))))

(declare-fun b!289775 () Bool)

(declare-fun res!151257 () Bool)

(declare-fun e!183433 () Bool)

(assert (=> b!289775 (=> (not res!151257) (not e!183433))))

(declare-datatypes ((array!14590 0))(
  ( (array!14591 (arr!6922 (Array (_ BitVec 32) (_ BitVec 64))) (size!7274 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14590)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14590 (_ BitVec 32)) Bool)

(assert (=> b!289775 (= res!151257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289776 () Bool)

(declare-fun res!151263 () Bool)

(declare-fun e!183434 () Bool)

(assert (=> b!289776 (=> (not res!151263) (not e!183434))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289776 (= res!151263 (validKeyInArray!0 k!2524))))

(declare-fun b!289777 () Bool)

(assert (=> b!289777 (= e!183434 e!183433)))

(declare-fun res!151259 () Bool)

(assert (=> b!289777 (=> (not res!151259) (not e!183433))))

(declare-fun lt!143042 () Bool)

(declare-fun lt!143044 () SeekEntryResult!2071)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289777 (= res!151259 (or lt!143042 (= lt!143044 (MissingVacant!2071 i!1256))))))

(assert (=> b!289777 (= lt!143042 (= lt!143044 (MissingZero!2071 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14590 (_ BitVec 32)) SeekEntryResult!2071)

(assert (=> b!289777 (= lt!143044 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289778 () Bool)

(declare-fun res!151258 () Bool)

(assert (=> b!289778 (=> (not res!151258) (not e!183434))))

(declare-fun arrayContainsKey!0 (array!14590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289778 (= res!151258 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun lt!143043 () SeekEntryResult!2071)

(declare-fun b!289780 () Bool)

(assert (=> b!289780 (and (= lt!143043 lt!143041) (= (select (store (arr!6922 a!3312) i!1256 k!2524) (index!10456 lt!143041)) k!2524))))

(declare-fun lt!143040 () Unit!9135)

(declare-fun lt!143039 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9135)

(assert (=> b!289780 (= lt!143040 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!143039 (index!10456 lt!143041) (x!28652 lt!143041) mask!3809))))

(assert (=> b!289780 (and (= (select (arr!6922 a!3312) (index!10456 lt!143041)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10456 lt!143041) i!1256))))

(declare-fun Unit!9137 () Unit!9135)

(assert (=> b!289780 (= e!183431 Unit!9137)))

(declare-fun b!289781 () Bool)

(declare-fun res!151262 () Bool)

(assert (=> b!289781 (=> (not res!151262) (not e!183434))))

(assert (=> b!289781 (= res!151262 (and (= (size!7274 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7274 a!3312))))))

(declare-fun b!289782 () Bool)

(assert (=> b!289782 false))

(declare-fun Unit!9138 () Unit!9135)

(assert (=> b!289782 (= e!183431 Unit!9138)))

(declare-fun b!289783 () Bool)

(declare-fun Unit!9139 () Unit!9135)

(assert (=> b!289783 (= e!183430 Unit!9139)))

(assert (=> b!289783 false))

(declare-fun b!289784 () Bool)

(declare-fun e!183432 () Bool)

(assert (=> b!289784 (= e!183433 e!183432)))

(declare-fun res!151260 () Bool)

(assert (=> b!289784 (=> (not res!151260) (not e!183432))))

(assert (=> b!289784 (= res!151260 lt!143042)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14590 (_ BitVec 32)) SeekEntryResult!2071)

(assert (=> b!289784 (= lt!143043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143039 k!2524 (array!14591 (store (arr!6922 a!3312) i!1256 k!2524) (size!7274 a!3312)) mask!3809))))

(assert (=> b!289784 (= lt!143041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143039 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289784 (= lt!143039 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!151261 () Bool)

(assert (=> start!28276 (=> (not res!151261) (not e!183434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28276 (= res!151261 (validMask!0 mask!3809))))

(assert (=> start!28276 e!183434))

(assert (=> start!28276 true))

(declare-fun array_inv!4885 (array!14590) Bool)

(assert (=> start!28276 (array_inv!4885 a!3312)))

(declare-fun b!289779 () Bool)

(assert (=> b!289779 (= e!183432 false)))

(declare-fun lt!143038 () Unit!9135)

(assert (=> b!289779 (= lt!143038 e!183430)))

(declare-fun c!46820 () Bool)

(assert (=> b!289779 (= c!46820 (or (and (is-Intermediate!2071 lt!143041) (undefined!2883 lt!143041)) (and (is-Intermediate!2071 lt!143041) (= (select (arr!6922 a!3312) (index!10456 lt!143041)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2071 lt!143041) (= (select (arr!6922 a!3312) (index!10456 lt!143041)) k!2524))))))

(assert (= (and start!28276 res!151261) b!289781))

(assert (= (and b!289781 res!151262) b!289776))

(assert (= (and b!289776 res!151263) b!289778))

(assert (= (and b!289778 res!151258) b!289777))

(assert (= (and b!289777 res!151259) b!289775))

(assert (= (and b!289775 res!151257) b!289784))

(assert (= (and b!289784 res!151260) b!289779))

(assert (= (and b!289779 c!46820) b!289783))

(assert (= (and b!289779 (not c!46820)) b!289774))

(assert (= (and b!289774 c!46821) b!289780))

(assert (= (and b!289774 (not c!46821)) b!289782))

(declare-fun m!303841 () Bool)

(assert (=> b!289779 m!303841))

(declare-fun m!303843 () Bool)

(assert (=> b!289780 m!303843))

(declare-fun m!303845 () Bool)

(assert (=> b!289780 m!303845))

(declare-fun m!303847 () Bool)

(assert (=> b!289780 m!303847))

(assert (=> b!289780 m!303841))

(declare-fun m!303849 () Bool)

(assert (=> b!289775 m!303849))

(assert (=> b!289784 m!303843))

(declare-fun m!303851 () Bool)

(assert (=> b!289784 m!303851))

(declare-fun m!303853 () Bool)

(assert (=> b!289784 m!303853))

(declare-fun m!303855 () Bool)

(assert (=> b!289784 m!303855))

(declare-fun m!303857 () Bool)

(assert (=> b!289777 m!303857))

(declare-fun m!303859 () Bool)

(assert (=> b!289778 m!303859))

(declare-fun m!303861 () Bool)

(assert (=> start!28276 m!303861))

(declare-fun m!303863 () Bool)

(assert (=> start!28276 m!303863))

(declare-fun m!303865 () Bool)

(assert (=> b!289776 m!303865))

(push 1)

