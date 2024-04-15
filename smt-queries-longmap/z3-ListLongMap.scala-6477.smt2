; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82684 () Bool)

(assert start!82684)

(declare-fun b_free!18835 () Bool)

(declare-fun b_next!18835 () Bool)

(assert (=> start!82684 (= b_free!18835 (not b_next!18835))))

(declare-fun tp!65626 () Bool)

(declare-fun b_and!30297 () Bool)

(assert (=> start!82684 (= tp!65626 b_and!30297)))

(declare-fun b!964149 () Bool)

(declare-fun e!543541 () Bool)

(declare-fun e!543539 () Bool)

(declare-fun mapRes!34450 () Bool)

(assert (=> b!964149 (= e!543541 (and e!543539 mapRes!34450))))

(declare-fun condMapEmpty!34450 () Bool)

(declare-datatypes ((V!33833 0))(
  ( (V!33834 (val!10869 Int)) )
))
(declare-datatypes ((ValueCell!10337 0))(
  ( (ValueCellFull!10337 (v!13426 V!33833)) (EmptyCell!10337) )
))
(declare-datatypes ((array!59296 0))(
  ( (array!59297 (arr!28517 (Array (_ BitVec 32) ValueCell!10337)) (size!28998 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59296)

(declare-fun mapDefault!34450 () ValueCell!10337)

(assert (=> b!964149 (= condMapEmpty!34450 (= (arr!28517 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10337)) mapDefault!34450)))))

(declare-fun b!964150 () Bool)

(declare-fun res!645386 () Bool)

(declare-fun e!543537 () Bool)

(assert (=> b!964150 (=> (not res!645386) (not e!543537))))

(declare-datatypes ((array!59298 0))(
  ( (array!59299 (arr!28518 (Array (_ BitVec 32) (_ BitVec 64))) (size!28999 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59298)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964150 (= res!645386 (validKeyInArray!0 (select (arr!28518 _keys!1686) i!803)))))

(declare-fun b!964151 () Bool)

(declare-fun res!645388 () Bool)

(assert (=> b!964151 (=> (not res!645388) (not e!543537))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964151 (= res!645388 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964153 () Bool)

(declare-fun res!645392 () Bool)

(assert (=> b!964153 (=> (not res!645392) (not e!543537))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59298 (_ BitVec 32)) Bool)

(assert (=> b!964153 (= res!645392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34450 () Bool)

(declare-fun tp!65625 () Bool)

(declare-fun e!543538 () Bool)

(assert (=> mapNonEmpty!34450 (= mapRes!34450 (and tp!65625 e!543538))))

(declare-fun mapRest!34450 () (Array (_ BitVec 32) ValueCell!10337))

(declare-fun mapValue!34450 () ValueCell!10337)

(declare-fun mapKey!34450 () (_ BitVec 32))

(assert (=> mapNonEmpty!34450 (= (arr!28517 _values!1400) (store mapRest!34450 mapKey!34450 mapValue!34450))))

(declare-fun b!964154 () Bool)

(declare-fun e!543540 () Bool)

(assert (=> b!964154 (= e!543540 true)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33833)

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!33833)

(declare-datatypes ((tuple2!14038 0))(
  ( (tuple2!14039 (_1!7030 (_ BitVec 64)) (_2!7030 V!33833)) )
))
(declare-datatypes ((List!19846 0))(
  ( (Nil!19843) (Cons!19842 (h!21004 tuple2!14038) (t!28200 List!19846)) )
))
(declare-datatypes ((ListLongMap!12725 0))(
  ( (ListLongMap!12726 (toList!6378 List!19846)) )
))
(declare-fun contains!5425 (ListLongMap!12725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3540 (array!59298 array!59296 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) Int) ListLongMap!12725)

(assert (=> b!964154 (contains!5425 (getCurrentListMap!3540 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28518 _keys!1686) i!803))))

(declare-datatypes ((Unit!32142 0))(
  ( (Unit!32143) )
))
(declare-fun lt!430858 () Unit!32142)

(declare-fun lemmaInListMapFromThenInFromSmaller!32 (array!59298 array!59296 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32142)

(assert (=> b!964154 (= lt!430858 (lemmaInListMapFromThenInFromSmaller!32 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964155 () Bool)

(declare-fun res!645389 () Bool)

(assert (=> b!964155 (=> (not res!645389) (not e!543537))))

(assert (=> b!964155 (= res!645389 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28999 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28999 _keys!1686))))))

(declare-fun mapIsEmpty!34450 () Bool)

(assert (=> mapIsEmpty!34450 mapRes!34450))

(declare-fun b!964156 () Bool)

(declare-fun tp_is_empty!21637 () Bool)

(assert (=> b!964156 (= e!543539 tp_is_empty!21637)))

(declare-fun res!645387 () Bool)

(assert (=> start!82684 (=> (not res!645387) (not e!543537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82684 (= res!645387 (validMask!0 mask!2110))))

(assert (=> start!82684 e!543537))

(assert (=> start!82684 true))

(declare-fun array_inv!22149 (array!59296) Bool)

(assert (=> start!82684 (and (array_inv!22149 _values!1400) e!543541)))

(declare-fun array_inv!22150 (array!59298) Bool)

(assert (=> start!82684 (array_inv!22150 _keys!1686)))

(assert (=> start!82684 tp!65626))

(assert (=> start!82684 tp_is_empty!21637))

(declare-fun b!964152 () Bool)

(declare-fun res!645391 () Bool)

(assert (=> b!964152 (=> (not res!645391) (not e!543537))))

(assert (=> b!964152 (= res!645391 (and (= (size!28998 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28999 _keys!1686) (size!28998 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964157 () Bool)

(assert (=> b!964157 (= e!543537 (not e!543540))))

(declare-fun res!645384 () Bool)

(assert (=> b!964157 (=> res!645384 e!543540)))

(assert (=> b!964157 (= res!645384 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!28999 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964157 (contains!5425 (getCurrentListMap!3540 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28518 _keys!1686) i!803))))

(declare-fun lt!430859 () Unit!32142)

(declare-fun lemmaInListMapFromThenInFromMinusOne!36 (array!59298 array!59296 (_ BitVec 32) (_ BitVec 32) V!33833 V!33833 (_ BitVec 32) (_ BitVec 32) Int) Unit!32142)

(assert (=> b!964157 (= lt!430859 (lemmaInListMapFromThenInFromMinusOne!36 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964158 () Bool)

(declare-fun res!645390 () Bool)

(assert (=> b!964158 (=> (not res!645390) (not e!543537))))

(declare-datatypes ((List!19847 0))(
  ( (Nil!19844) (Cons!19843 (h!21005 (_ BitVec 64)) (t!28201 List!19847)) )
))
(declare-fun arrayNoDuplicates!0 (array!59298 (_ BitVec 32) List!19847) Bool)

(assert (=> b!964158 (= res!645390 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19844))))

(declare-fun b!964159 () Bool)

(declare-fun res!645385 () Bool)

(assert (=> b!964159 (=> (not res!645385) (not e!543537))))

(assert (=> b!964159 (= res!645385 (contains!5425 (getCurrentListMap!3540 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28518 _keys!1686) i!803)))))

(declare-fun b!964160 () Bool)

(assert (=> b!964160 (= e!543538 tp_is_empty!21637)))

(assert (= (and start!82684 res!645387) b!964152))

(assert (= (and b!964152 res!645391) b!964153))

(assert (= (and b!964153 res!645392) b!964158))

(assert (= (and b!964158 res!645390) b!964155))

(assert (= (and b!964155 res!645389) b!964150))

(assert (= (and b!964150 res!645386) b!964159))

(assert (= (and b!964159 res!645385) b!964151))

(assert (= (and b!964151 res!645388) b!964157))

(assert (= (and b!964157 (not res!645384)) b!964154))

(assert (= (and b!964149 condMapEmpty!34450) mapIsEmpty!34450))

(assert (= (and b!964149 (not condMapEmpty!34450)) mapNonEmpty!34450))

(get-info :version)

(assert (= (and mapNonEmpty!34450 ((_ is ValueCellFull!10337) mapValue!34450)) b!964160))

(assert (= (and b!964149 ((_ is ValueCellFull!10337) mapDefault!34450)) b!964156))

(assert (= start!82684 b!964149))

(declare-fun m!892891 () Bool)

(assert (=> b!964153 m!892891))

(declare-fun m!892893 () Bool)

(assert (=> mapNonEmpty!34450 m!892893))

(declare-fun m!892895 () Bool)

(assert (=> b!964158 m!892895))

(declare-fun m!892897 () Bool)

(assert (=> start!82684 m!892897))

(declare-fun m!892899 () Bool)

(assert (=> start!82684 m!892899))

(declare-fun m!892901 () Bool)

(assert (=> start!82684 m!892901))

(declare-fun m!892903 () Bool)

(assert (=> b!964157 m!892903))

(declare-fun m!892905 () Bool)

(assert (=> b!964157 m!892905))

(assert (=> b!964157 m!892903))

(assert (=> b!964157 m!892905))

(declare-fun m!892907 () Bool)

(assert (=> b!964157 m!892907))

(declare-fun m!892909 () Bool)

(assert (=> b!964157 m!892909))

(declare-fun m!892911 () Bool)

(assert (=> b!964159 m!892911))

(assert (=> b!964159 m!892905))

(assert (=> b!964159 m!892911))

(assert (=> b!964159 m!892905))

(declare-fun m!892913 () Bool)

(assert (=> b!964159 m!892913))

(declare-fun m!892915 () Bool)

(assert (=> b!964154 m!892915))

(assert (=> b!964154 m!892905))

(assert (=> b!964154 m!892915))

(assert (=> b!964154 m!892905))

(declare-fun m!892917 () Bool)

(assert (=> b!964154 m!892917))

(declare-fun m!892919 () Bool)

(assert (=> b!964154 m!892919))

(assert (=> b!964150 m!892905))

(assert (=> b!964150 m!892905))

(declare-fun m!892921 () Bool)

(assert (=> b!964150 m!892921))

(check-sat (not b_next!18835) (not start!82684) (not b!964157) (not b!964150) (not b!964154) (not b!964159) (not mapNonEmpty!34450) (not b!964158) b_and!30297 (not b!964153) tp_is_empty!21637)
(check-sat b_and!30297 (not b_next!18835))
