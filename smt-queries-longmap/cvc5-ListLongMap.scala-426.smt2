; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7946 () Bool)

(assert start!7946)

(declare-fun res!28822 () Bool)

(declare-fun e!32130 () Bool)

(assert (=> start!7946 (=> (not res!28822) (not e!32130))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7946 (= res!28822 (validMask!0 mask!2234))))

(assert (=> start!7946 e!32130))

(assert (=> start!7946 true))

(declare-datatypes ((array!3246 0))(
  ( (array!3247 (arr!1554 (Array (_ BitVec 32) (_ BitVec 64))) (size!1776 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3246)

(declare-fun array_inv!950 (array!3246) Bool)

(assert (=> start!7946 (array_inv!950 _keys!1794)))

(declare-fun b!49873 () Bool)

(declare-fun res!28823 () Bool)

(assert (=> b!49873 (=> (not res!28823) (not e!32130))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49873 (= res!28823 (and (= (size!1776 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3247 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1776 _keys!1794)) (bvsge i!836 (size!1776 _keys!1794))))))

(declare-fun b!49874 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3246 (_ BitVec 32)) Bool)

(assert (=> b!49874 (= e!32130 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (= (and start!7946 res!28822) b!49873))

(assert (= (and b!49873 res!28823) b!49874))

(declare-fun m!43365 () Bool)

(assert (=> start!7946 m!43365))

(declare-fun m!43367 () Bool)

(assert (=> start!7946 m!43367))

(declare-fun m!43369 () Bool)

(assert (=> b!49874 m!43369))

(push 1)

(assert (not b!49874))

(assert (not start!7946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3867 () Bool)

(declare-fun call!3870 () Bool)

(assert (=> bm!3867 (= call!3870 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun d!10067 () Bool)

(declare-fun res!28851 () Bool)

(declare-fun e!32166 () Bool)

(assert (=> d!10067 (=> res!28851 e!32166)))

(assert (=> d!10067 (= res!28851 (bvsge i!836 (size!1776 _keys!1794)))))

(assert (=> d!10067 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32166)))

(declare-fun b!49915 () Bool)

(declare-fun e!32167 () Bool)

(declare-fun e!32165 () Bool)

(assert (=> b!49915 (= e!32167 e!32165)))

(declare-fun lt!20998 () (_ BitVec 64))

(assert (=> b!49915 (= lt!20998 (select (arr!1554 _keys!1794) i!836))))

(declare-datatypes ((Unit!1413 0))(
  ( (Unit!1414) )
))
(declare-fun lt!20997 () Unit!1413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3246 (_ BitVec 64) (_ BitVec 32)) Unit!1413)

(assert (=> b!49915 (= lt!20997 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20998 i!836))))

(declare-fun arrayContainsKey!0 (array!3246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49915 (arrayContainsKey!0 _keys!1794 lt!20998 #b00000000000000000000000000000000)))

(declare-fun lt!20999 () Unit!1413)

(assert (=> b!49915 (= lt!20999 lt!20997)))

(declare-fun res!28850 () Bool)

(declare-datatypes ((SeekEntryResult!216 0))(
  ( (MissingZero!216 (index!2986 (_ BitVec 32))) (Found!216 (index!2987 (_ BitVec 32))) (Intermediate!216 (undefined!1028 Bool) (index!2988 (_ BitVec 32)) (x!9114 (_ BitVec 32))) (Undefined!216) (MissingVacant!216 (index!2989 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3246 (_ BitVec 32)) SeekEntryResult!216)

(assert (=> b!49915 (= res!28850 (= (seekEntryOrOpen!0 (select (arr!1554 _keys!1794) i!836) _keys!1794 mask!2234) (Found!216 i!836)))))

(assert (=> b!49915 (=> (not res!28850) (not e!32165))))

(declare-fun b!49916 () Bool)

(assert (=> b!49916 (= e!32166 e!32167)))

(declare-fun c!6758 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49916 (= c!6758 (validKeyInArray!0 (select (arr!1554 _keys!1794) i!836)))))

(declare-fun b!49917 () Bool)

(assert (=> b!49917 (= e!32165 call!3870)))

(declare-fun b!49918 () Bool)

(assert (=> b!49918 (= e!32167 call!3870)))

(assert (= (and d!10067 (not res!28851)) b!49916))

(assert (= (and b!49916 c!6758) b!49915))

(assert (= (and b!49916 (not c!6758)) b!49918))

(assert (= (and b!49915 res!28850) b!49917))

(assert (= (or b!49917 b!49918) bm!3867))

(declare-fun m!43395 () Bool)

(assert (=> bm!3867 m!43395))

(declare-fun m!43397 () Bool)

(assert (=> b!49915 m!43397))

(declare-fun m!43399 () Bool)

(assert (=> b!49915 m!43399))

(declare-fun m!43401 () Bool)

(assert (=> b!49915 m!43401))

(assert (=> b!49915 m!43397))

(declare-fun m!43403 () Bool)

(assert (=> b!49915 m!43403))

(assert (=> b!49916 m!43397))

(assert (=> b!49916 m!43397))

(declare-fun m!43405 () Bool)

(assert (=> b!49916 m!43405))

(assert (=> b!49874 d!10067))

(declare-fun d!10073 () Bool)

(assert (=> d!10073 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7946 d!10073))

(declare-fun d!10079 () Bool)

(assert (=> d!10079 (= (array_inv!950 _keys!1794) (bvsge (size!1776 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7946 d!10079))

