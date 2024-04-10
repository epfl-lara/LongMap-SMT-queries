; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81786 () Bool)

(assert start!81786)

(declare-fun b!953916 () Bool)

(declare-fun e!537404 () Bool)

(declare-fun tp_is_empty!20847 () Bool)

(assert (=> b!953916 (= e!537404 tp_is_empty!20847)))

(declare-fun b!953917 () Bool)

(declare-fun res!638798 () Bool)

(declare-fun e!537402 () Bool)

(assert (=> b!953917 (=> (not res!638798) (not e!537402))))

(declare-datatypes ((array!57803 0))(
  ( (array!57804 (arr!27783 (Array (_ BitVec 32) (_ BitVec 64))) (size!28262 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57803)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57803 (_ BitVec 32)) Bool)

(assert (=> b!953917 (= res!638798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953918 () Bool)

(declare-fun res!638799 () Bool)

(assert (=> b!953918 (=> (not res!638799) (not e!537402))))

(assert (=> b!953918 (= res!638799 (and (bvsle #b00000000000000000000000000000000 (size!28262 _keys!1441)) (bvslt (size!28262 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!33226 () Bool)

(declare-fun mapRes!33226 () Bool)

(assert (=> mapIsEmpty!33226 mapRes!33226))

(declare-fun b!953920 () Bool)

(declare-datatypes ((List!19377 0))(
  ( (Nil!19374) (Cons!19373 (h!20535 (_ BitVec 64)) (t!27738 List!19377)) )
))
(declare-fun noDuplicate!1357 (List!19377) Bool)

(assert (=> b!953920 (= e!537402 (not (noDuplicate!1357 Nil!19374)))))

(declare-fun b!953921 () Bool)

(declare-fun res!638797 () Bool)

(assert (=> b!953921 (=> (not res!638797) (not e!537402))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32779 0))(
  ( (V!32780 (val!10474 Int)) )
))
(declare-datatypes ((ValueCell!9942 0))(
  ( (ValueCellFull!9942 (v!13028 V!32779)) (EmptyCell!9942) )
))
(declare-datatypes ((array!57805 0))(
  ( (array!57806 (arr!27784 (Array (_ BitVec 32) ValueCell!9942)) (size!28263 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57805)

(assert (=> b!953921 (= res!638797 (and (= (size!28263 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28262 _keys!1441) (size!28263 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33226 () Bool)

(declare-fun tp!63615 () Bool)

(declare-fun e!537403 () Bool)

(assert (=> mapNonEmpty!33226 (= mapRes!33226 (and tp!63615 e!537403))))

(declare-fun mapValue!33226 () ValueCell!9942)

(declare-fun mapRest!33226 () (Array (_ BitVec 32) ValueCell!9942))

(declare-fun mapKey!33226 () (_ BitVec 32))

(assert (=> mapNonEmpty!33226 (= (arr!27784 _values!1197) (store mapRest!33226 mapKey!33226 mapValue!33226))))

(declare-fun b!953922 () Bool)

(assert (=> b!953922 (= e!537403 tp_is_empty!20847)))

(declare-fun b!953919 () Bool)

(declare-fun e!537401 () Bool)

(assert (=> b!953919 (= e!537401 (and e!537404 mapRes!33226))))

(declare-fun condMapEmpty!33226 () Bool)

(declare-fun mapDefault!33226 () ValueCell!9942)

(assert (=> b!953919 (= condMapEmpty!33226 (= (arr!27784 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9942)) mapDefault!33226)))))

(declare-fun res!638800 () Bool)

(assert (=> start!81786 (=> (not res!638800) (not e!537402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81786 (= res!638800 (validMask!0 mask!1823))))

(assert (=> start!81786 e!537402))

(assert (=> start!81786 true))

(declare-fun array_inv!21569 (array!57805) Bool)

(assert (=> start!81786 (and (array_inv!21569 _values!1197) e!537401)))

(declare-fun array_inv!21570 (array!57803) Bool)

(assert (=> start!81786 (array_inv!21570 _keys!1441)))

(assert (= (and start!81786 res!638800) b!953921))

(assert (= (and b!953921 res!638797) b!953917))

(assert (= (and b!953917 res!638798) b!953918))

(assert (= (and b!953918 res!638799) b!953920))

(assert (= (and b!953919 condMapEmpty!33226) mapIsEmpty!33226))

(assert (= (and b!953919 (not condMapEmpty!33226)) mapNonEmpty!33226))

(get-info :version)

(assert (= (and mapNonEmpty!33226 ((_ is ValueCellFull!9942) mapValue!33226)) b!953922))

(assert (= (and b!953919 ((_ is ValueCellFull!9942) mapDefault!33226)) b!953916))

(assert (= start!81786 b!953919))

(declare-fun m!885805 () Bool)

(assert (=> b!953917 m!885805))

(declare-fun m!885807 () Bool)

(assert (=> b!953920 m!885807))

(declare-fun m!885809 () Bool)

(assert (=> mapNonEmpty!33226 m!885809))

(declare-fun m!885811 () Bool)

(assert (=> start!81786 m!885811))

(declare-fun m!885813 () Bool)

(assert (=> start!81786 m!885813))

(declare-fun m!885815 () Bool)

(assert (=> start!81786 m!885815))

(check-sat tp_is_empty!20847 (not b!953917) (not b!953920) (not mapNonEmpty!33226) (not start!81786))
(check-sat)
(get-model)

(declare-fun b!953952 () Bool)

(declare-fun e!537427 () Bool)

(declare-fun e!537426 () Bool)

(assert (=> b!953952 (= e!537427 e!537426)))

(declare-fun c!99863 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953952 (= c!99863 (validKeyInArray!0 (select (arr!27783 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!953953 () Bool)

(declare-fun call!41675 () Bool)

(assert (=> b!953953 (= e!537426 call!41675)))

(declare-fun b!953954 () Bool)

(declare-fun e!537428 () Bool)

(assert (=> b!953954 (= e!537428 call!41675)))

(declare-fun bm!41672 () Bool)

(assert (=> bm!41672 (= call!41675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!953955 () Bool)

(assert (=> b!953955 (= e!537426 e!537428)))

(declare-fun lt!429846 () (_ BitVec 64))

(assert (=> b!953955 (= lt!429846 (select (arr!27783 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32089 0))(
  ( (Unit!32090) )
))
(declare-fun lt!429845 () Unit!32089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57803 (_ BitVec 64) (_ BitVec 32)) Unit!32089)

(assert (=> b!953955 (= lt!429845 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429846 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953955 (arrayContainsKey!0 _keys!1441 lt!429846 #b00000000000000000000000000000000)))

(declare-fun lt!429847 () Unit!32089)

(assert (=> b!953955 (= lt!429847 lt!429845)))

(declare-fun res!638817 () Bool)

(declare-datatypes ((SeekEntryResult!9186 0))(
  ( (MissingZero!9186 (index!39115 (_ BitVec 32))) (Found!9186 (index!39116 (_ BitVec 32))) (Intermediate!9186 (undefined!9998 Bool) (index!39117 (_ BitVec 32)) (x!82138 (_ BitVec 32))) (Undefined!9186) (MissingVacant!9186 (index!39118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57803 (_ BitVec 32)) SeekEntryResult!9186)

(assert (=> b!953955 (= res!638817 (= (seekEntryOrOpen!0 (select (arr!27783 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9186 #b00000000000000000000000000000000)))))

(assert (=> b!953955 (=> (not res!638817) (not e!537428))))

(declare-fun d!115745 () Bool)

(declare-fun res!638818 () Bool)

(assert (=> d!115745 (=> res!638818 e!537427)))

(assert (=> d!115745 (= res!638818 (bvsge #b00000000000000000000000000000000 (size!28262 _keys!1441)))))

(assert (=> d!115745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537427)))

(assert (= (and d!115745 (not res!638818)) b!953952))

(assert (= (and b!953952 c!99863) b!953955))

(assert (= (and b!953952 (not c!99863)) b!953953))

(assert (= (and b!953955 res!638817) b!953954))

(assert (= (or b!953954 b!953953) bm!41672))

(declare-fun m!885829 () Bool)

(assert (=> b!953952 m!885829))

(assert (=> b!953952 m!885829))

(declare-fun m!885831 () Bool)

(assert (=> b!953952 m!885831))

(declare-fun m!885833 () Bool)

(assert (=> bm!41672 m!885833))

(assert (=> b!953955 m!885829))

(declare-fun m!885835 () Bool)

(assert (=> b!953955 m!885835))

(declare-fun m!885837 () Bool)

(assert (=> b!953955 m!885837))

(assert (=> b!953955 m!885829))

(declare-fun m!885839 () Bool)

(assert (=> b!953955 m!885839))

(assert (=> b!953917 d!115745))

(declare-fun d!115747 () Bool)

(declare-fun res!638823 () Bool)

(declare-fun e!537433 () Bool)

(assert (=> d!115747 (=> res!638823 e!537433)))

(assert (=> d!115747 (= res!638823 ((_ is Nil!19374) Nil!19374))))

(assert (=> d!115747 (= (noDuplicate!1357 Nil!19374) e!537433)))

(declare-fun b!953960 () Bool)

(declare-fun e!537434 () Bool)

(assert (=> b!953960 (= e!537433 e!537434)))

(declare-fun res!638824 () Bool)

(assert (=> b!953960 (=> (not res!638824) (not e!537434))))

(declare-fun contains!5260 (List!19377 (_ BitVec 64)) Bool)

(assert (=> b!953960 (= res!638824 (not (contains!5260 (t!27738 Nil!19374) (h!20535 Nil!19374))))))

(declare-fun b!953961 () Bool)

(assert (=> b!953961 (= e!537434 (noDuplicate!1357 (t!27738 Nil!19374)))))

(assert (= (and d!115747 (not res!638823)) b!953960))

(assert (= (and b!953960 res!638824) b!953961))

(declare-fun m!885841 () Bool)

(assert (=> b!953960 m!885841))

(declare-fun m!885843 () Bool)

(assert (=> b!953961 m!885843))

(assert (=> b!953920 d!115747))

(declare-fun d!115749 () Bool)

(assert (=> d!115749 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81786 d!115749))

(declare-fun d!115751 () Bool)

(assert (=> d!115751 (= (array_inv!21569 _values!1197) (bvsge (size!28263 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81786 d!115751))

(declare-fun d!115753 () Bool)

(assert (=> d!115753 (= (array_inv!21570 _keys!1441) (bvsge (size!28262 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81786 d!115753))

(declare-fun mapIsEmpty!33232 () Bool)

(declare-fun mapRes!33232 () Bool)

(assert (=> mapIsEmpty!33232 mapRes!33232))

(declare-fun b!953969 () Bool)

(declare-fun e!537440 () Bool)

(assert (=> b!953969 (= e!537440 tp_is_empty!20847)))

(declare-fun condMapEmpty!33232 () Bool)

(declare-fun mapDefault!33232 () ValueCell!9942)

(assert (=> mapNonEmpty!33226 (= condMapEmpty!33232 (= mapRest!33226 ((as const (Array (_ BitVec 32) ValueCell!9942)) mapDefault!33232)))))

(assert (=> mapNonEmpty!33226 (= tp!63615 (and e!537440 mapRes!33232))))

(declare-fun mapNonEmpty!33232 () Bool)

(declare-fun tp!63621 () Bool)

(declare-fun e!537439 () Bool)

(assert (=> mapNonEmpty!33232 (= mapRes!33232 (and tp!63621 e!537439))))

(declare-fun mapValue!33232 () ValueCell!9942)

(declare-fun mapKey!33232 () (_ BitVec 32))

(declare-fun mapRest!33232 () (Array (_ BitVec 32) ValueCell!9942))

(assert (=> mapNonEmpty!33232 (= mapRest!33226 (store mapRest!33232 mapKey!33232 mapValue!33232))))

(declare-fun b!953968 () Bool)

(assert (=> b!953968 (= e!537439 tp_is_empty!20847)))

(assert (= (and mapNonEmpty!33226 condMapEmpty!33232) mapIsEmpty!33232))

(assert (= (and mapNonEmpty!33226 (not condMapEmpty!33232)) mapNonEmpty!33232))

(assert (= (and mapNonEmpty!33232 ((_ is ValueCellFull!9942) mapValue!33232)) b!953968))

(assert (= (and mapNonEmpty!33226 ((_ is ValueCellFull!9942) mapDefault!33232)) b!953969))

(declare-fun m!885845 () Bool)

(assert (=> mapNonEmpty!33232 m!885845))

(check-sat tp_is_empty!20847 (not b!953955) (not b!953961) (not mapNonEmpty!33232) (not b!953952) (not b!953960) (not bm!41672))
(check-sat)
