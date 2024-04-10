; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82396 () Bool)

(assert start!82396)

(declare-fun b_free!18663 () Bool)

(declare-fun b_next!18663 () Bool)

(assert (=> start!82396 (= b_free!18663 (not b_next!18663))))

(declare-fun tp!64958 () Bool)

(declare-fun b_and!30151 () Bool)

(assert (=> start!82396 (= tp!64958 b_and!30151)))

(declare-fun b!960778 () Bool)

(declare-fun res!643127 () Bool)

(declare-fun e!541586 () Bool)

(assert (=> b!960778 (=> (not res!643127) (not e!541586))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33483 0))(
  ( (V!33484 (val!10738 Int)) )
))
(declare-fun minValue!1328 () V!33483)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58839 0))(
  ( (array!58840 (arr!28293 (Array (_ BitVec 32) (_ BitVec 64))) (size!28772 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58839)

(declare-datatypes ((ValueCell!10206 0))(
  ( (ValueCellFull!10206 (v!13295 V!33483)) (EmptyCell!10206) )
))
(declare-datatypes ((array!58841 0))(
  ( (array!58842 (arr!28294 (Array (_ BitVec 32) ValueCell!10206)) (size!28773 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58841)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33483)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13852 0))(
  ( (tuple2!13853 (_1!6937 (_ BitVec 64)) (_2!6937 V!33483)) )
))
(declare-datatypes ((List!19674 0))(
  ( (Nil!19671) (Cons!19670 (h!20832 tuple2!13852) (t!28037 List!19674)) )
))
(declare-datatypes ((ListLongMap!12549 0))(
  ( (ListLongMap!12550 (toList!6290 List!19674)) )
))
(declare-fun contains!5389 (ListLongMap!12549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3523 (array!58839 array!58841 (_ BitVec 32) (_ BitVec 32) V!33483 V!33483 (_ BitVec 32) Int) ListLongMap!12549)

(assert (=> b!960778 (= res!643127 (contains!5389 (getCurrentListMap!3523 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28293 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!34042 () Bool)

(declare-fun mapRes!34042 () Bool)

(declare-fun tp!64959 () Bool)

(declare-fun e!541589 () Bool)

(assert (=> mapNonEmpty!34042 (= mapRes!34042 (and tp!64959 e!541589))))

(declare-fun mapValue!34042 () ValueCell!10206)

(declare-fun mapRest!34042 () (Array (_ BitVec 32) ValueCell!10206))

(declare-fun mapKey!34042 () (_ BitVec 32))

(assert (=> mapNonEmpty!34042 (= (arr!28294 _values!1386) (store mapRest!34042 mapKey!34042 mapValue!34042))))

(declare-fun b!960779 () Bool)

(declare-fun res!643132 () Bool)

(assert (=> b!960779 (=> (not res!643132) (not e!541586))))

(declare-datatypes ((List!19675 0))(
  ( (Nil!19672) (Cons!19671 (h!20833 (_ BitVec 64)) (t!28038 List!19675)) )
))
(declare-fun arrayNoDuplicates!0 (array!58839 (_ BitVec 32) List!19675) Bool)

(assert (=> b!960779 (= res!643132 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19672))))

(declare-fun b!960780 () Bool)

(declare-fun e!541588 () Bool)

(declare-fun tp_is_empty!21375 () Bool)

(assert (=> b!960780 (= e!541588 tp_is_empty!21375)))

(declare-fun b!960781 () Bool)

(declare-fun res!643130 () Bool)

(assert (=> b!960781 (=> (not res!643130) (not e!541586))))

(assert (=> b!960781 (= res!643130 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28772 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28772 _keys!1668))))))

(declare-fun b!960782 () Bool)

(declare-fun res!643128 () Bool)

(assert (=> b!960782 (=> (not res!643128) (not e!541586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960782 (= res!643128 (validKeyInArray!0 (select (arr!28293 _keys!1668) i!793)))))

(declare-fun b!960783 () Bool)

(declare-fun res!643133 () Bool)

(assert (=> b!960783 (=> (not res!643133) (not e!541586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58839 (_ BitVec 32)) Bool)

(assert (=> b!960783 (= res!643133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960784 () Bool)

(declare-fun e!541590 () Bool)

(assert (=> b!960784 (= e!541590 (and e!541588 mapRes!34042))))

(declare-fun condMapEmpty!34042 () Bool)

(declare-fun mapDefault!34042 () ValueCell!10206)

(assert (=> b!960784 (= condMapEmpty!34042 (= (arr!28294 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10206)) mapDefault!34042)))))

(declare-fun b!960785 () Bool)

(assert (=> b!960785 (= e!541586 (not (bvsge i!793 #b00000000000000000000000000000000)))))

(assert (=> b!960785 (contains!5389 (getCurrentListMap!3523 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28293 _keys!1668) i!793))))

(declare-datatypes ((Unit!32199 0))(
  ( (Unit!32200) )
))
(declare-fun lt!430686 () Unit!32199)

(declare-fun lemmaInListMapFromThenInFromSmaller!21 (array!58839 array!58841 (_ BitVec 32) (_ BitVec 32) V!33483 V!33483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32199)

(assert (=> b!960785 (= lt!430686 (lemmaInListMapFromThenInFromSmaller!21 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960786 () Bool)

(declare-fun res!643129 () Bool)

(assert (=> b!960786 (=> (not res!643129) (not e!541586))))

(assert (=> b!960786 (= res!643129 (and (= (size!28773 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28772 _keys!1668) (size!28773 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960787 () Bool)

(assert (=> b!960787 (= e!541589 tp_is_empty!21375)))

(declare-fun res!643131 () Bool)

(assert (=> start!82396 (=> (not res!643131) (not e!541586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82396 (= res!643131 (validMask!0 mask!2088))))

(assert (=> start!82396 e!541586))

(assert (=> start!82396 true))

(assert (=> start!82396 tp_is_empty!21375))

(declare-fun array_inv!21923 (array!58839) Bool)

(assert (=> start!82396 (array_inv!21923 _keys!1668)))

(declare-fun array_inv!21924 (array!58841) Bool)

(assert (=> start!82396 (and (array_inv!21924 _values!1386) e!541590)))

(assert (=> start!82396 tp!64958))

(declare-fun mapIsEmpty!34042 () Bool)

(assert (=> mapIsEmpty!34042 mapRes!34042))

(assert (= (and start!82396 res!643131) b!960786))

(assert (= (and b!960786 res!643129) b!960783))

(assert (= (and b!960783 res!643133) b!960779))

(assert (= (and b!960779 res!643132) b!960781))

(assert (= (and b!960781 res!643130) b!960782))

(assert (= (and b!960782 res!643128) b!960778))

(assert (= (and b!960778 res!643127) b!960785))

(assert (= (and b!960784 condMapEmpty!34042) mapIsEmpty!34042))

(assert (= (and b!960784 (not condMapEmpty!34042)) mapNonEmpty!34042))

(get-info :version)

(assert (= (and mapNonEmpty!34042 ((_ is ValueCellFull!10206) mapValue!34042)) b!960787))

(assert (= (and b!960784 ((_ is ValueCellFull!10206) mapDefault!34042)) b!960780))

(assert (= start!82396 b!960784))

(declare-fun m!890935 () Bool)

(assert (=> b!960778 m!890935))

(declare-fun m!890937 () Bool)

(assert (=> b!960778 m!890937))

(assert (=> b!960778 m!890935))

(assert (=> b!960778 m!890937))

(declare-fun m!890939 () Bool)

(assert (=> b!960778 m!890939))

(declare-fun m!890941 () Bool)

(assert (=> b!960783 m!890941))

(declare-fun m!890943 () Bool)

(assert (=> b!960785 m!890943))

(assert (=> b!960785 m!890937))

(assert (=> b!960785 m!890943))

(assert (=> b!960785 m!890937))

(declare-fun m!890945 () Bool)

(assert (=> b!960785 m!890945))

(declare-fun m!890947 () Bool)

(assert (=> b!960785 m!890947))

(declare-fun m!890949 () Bool)

(assert (=> b!960779 m!890949))

(assert (=> b!960782 m!890937))

(assert (=> b!960782 m!890937))

(declare-fun m!890951 () Bool)

(assert (=> b!960782 m!890951))

(declare-fun m!890953 () Bool)

(assert (=> mapNonEmpty!34042 m!890953))

(declare-fun m!890955 () Bool)

(assert (=> start!82396 m!890955))

(declare-fun m!890957 () Bool)

(assert (=> start!82396 m!890957))

(declare-fun m!890959 () Bool)

(assert (=> start!82396 m!890959))

(check-sat (not b!960779) (not b!960783) (not mapNonEmpty!34042) (not b!960778) (not start!82396) (not b!960785) (not b!960782) (not b_next!18663) b_and!30151 tp_is_empty!21375)
(check-sat b_and!30151 (not b_next!18663))
