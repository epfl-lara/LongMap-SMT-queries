; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7950 () Bool)

(assert start!7950)

(declare-fun res!28834 () Bool)

(declare-fun e!32142 () Bool)

(assert (=> start!7950 (=> (not res!28834) (not e!32142))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7950 (= res!28834 (validMask!0 mask!2234))))

(assert (=> start!7950 e!32142))

(assert (=> start!7950 true))

(declare-datatypes ((array!3250 0))(
  ( (array!3251 (arr!1556 (Array (_ BitVec 32) (_ BitVec 64))) (size!1778 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3250)

(declare-fun array_inv!952 (array!3250) Bool)

(assert (=> start!7950 (array_inv!952 _keys!1794)))

(declare-fun b!49885 () Bool)

(declare-fun res!28835 () Bool)

(assert (=> b!49885 (=> (not res!28835) (not e!32142))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49885 (= res!28835 (and (= (size!1778 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3251 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1778 _keys!1794)) (bvsge i!836 (size!1778 _keys!1794))))))

(declare-fun b!49886 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3250 (_ BitVec 32)) Bool)

(assert (=> b!49886 (= e!32142 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (= (and start!7950 res!28834) b!49885))

(assert (= (and b!49885 res!28835) b!49886))

(declare-fun m!43377 () Bool)

(assert (=> start!7950 m!43377))

(declare-fun m!43379 () Bool)

(assert (=> start!7950 m!43379))

(declare-fun m!43381 () Bool)

(assert (=> b!49886 m!43381))

(push 1)

(assert (not b!49886))

(assert (not start!7950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3868 () Bool)

(declare-fun call!3871 () Bool)

(assert (=> bm!3868 (= call!3871 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49919 () Bool)

(declare-fun e!32168 () Bool)

(assert (=> b!49919 (= e!32168 call!3871)))

(declare-fun b!49920 () Bool)

(declare-fun e!32170 () Bool)

(assert (=> b!49920 (= e!32168 e!32170)))

(declare-fun lt!21002 () (_ BitVec 64))

(assert (=> b!49920 (= lt!21002 (select (arr!1556 _keys!1794) i!836))))

(declare-datatypes ((Unit!1415 0))(
  ( (Unit!1416) )
))
(declare-fun lt!21001 () Unit!1415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3250 (_ BitVec 64) (_ BitVec 32)) Unit!1415)

(assert (=> b!49920 (= lt!21001 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!21002 i!836))))

(declare-fun arrayContainsKey!0 (array!3250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49920 (arrayContainsKey!0 _keys!1794 lt!21002 #b00000000000000000000000000000000)))

(declare-fun lt!21000 () Unit!1415)

(assert (=> b!49920 (= lt!21000 lt!21001)))

(declare-fun res!28853 () Bool)

(declare-datatypes ((SeekEntryResult!217 0))(
  ( (MissingZero!217 (index!2990 (_ BitVec 32))) (Found!217 (index!2991 (_ BitVec 32))) (Intermediate!217 (undefined!1029 Bool) (index!2992 (_ BitVec 32)) (x!9115 (_ BitVec 32))) (Undefined!217) (MissingVacant!217 (index!2993 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3250 (_ BitVec 32)) SeekEntryResult!217)

(assert (=> b!49920 (= res!28853 (= (seekEntryOrOpen!0 (select (arr!1556 _keys!1794) i!836) _keys!1794 mask!2234) (Found!217 i!836)))))

(assert (=> b!49920 (=> (not res!28853) (not e!32170))))

(declare-fun b!49921 () Bool)

(assert (=> b!49921 (= e!32170 call!3871)))

(declare-fun d!10069 () Bool)

(declare-fun res!28852 () Bool)

(declare-fun e!32169 () Bool)

(assert (=> d!10069 (=> res!28852 e!32169)))

(assert (=> d!10069 (= res!28852 (bvsge i!836 (size!1778 _keys!1794)))))

(assert (=> d!10069 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32169)))

(declare-fun b!49922 () Bool)

(assert (=> b!49922 (= e!32169 e!32168)))

(declare-fun c!6759 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49922 (= c!6759 (validKeyInArray!0 (select (arr!1556 _keys!1794) i!836)))))

(assert (= (and d!10069 (not res!28852)) b!49922))

(assert (= (and b!49922 c!6759) b!49920))

(assert (= (and b!49922 (not c!6759)) b!49919))

(assert (= (and b!49920 res!28853) b!49921))

(assert (= (or b!49921 b!49919) bm!3868))

