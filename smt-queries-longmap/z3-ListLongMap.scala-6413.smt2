; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82442 () Bool)

(assert start!82442)

(declare-fun b_free!18547 () Bool)

(declare-fun b_next!18547 () Bool)

(assert (=> start!82442 (= b_free!18547 (not b_next!18547))))

(declare-fun tp!64603 () Bool)

(declare-fun b_and!30045 () Bool)

(assert (=> start!82442 (= tp!64603 b_and!30045)))

(declare-fun b!959995 () Bool)

(declare-fun e!541253 () Bool)

(declare-fun tp_is_empty!21253 () Bool)

(assert (=> b!959995 (= e!541253 tp_is_empty!21253)))

(declare-fun b!959996 () Bool)

(declare-fun e!541255 () Bool)

(declare-fun e!541256 () Bool)

(declare-fun mapRes!33859 () Bool)

(assert (=> b!959996 (= e!541255 (and e!541256 mapRes!33859))))

(declare-fun condMapEmpty!33859 () Bool)

(declare-datatypes ((V!33321 0))(
  ( (V!33322 (val!10677 Int)) )
))
(declare-datatypes ((ValueCell!10145 0))(
  ( (ValueCellFull!10145 (v!13231 V!33321)) (EmptyCell!10145) )
))
(declare-datatypes ((array!58634 0))(
  ( (array!58635 (arr!28186 (Array (_ BitVec 32) ValueCell!10145)) (size!28666 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58634)

(declare-fun mapDefault!33859 () ValueCell!10145)

(assert (=> b!959996 (= condMapEmpty!33859 (= (arr!28186 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10145)) mapDefault!33859)))))

(declare-fun res!642334 () Bool)

(declare-fun e!541254 () Bool)

(assert (=> start!82442 (=> (not res!642334) (not e!541254))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82442 (= res!642334 (validMask!0 mask!2088))))

(assert (=> start!82442 e!541254))

(assert (=> start!82442 true))

(assert (=> start!82442 tp_is_empty!21253))

(declare-datatypes ((array!58636 0))(
  ( (array!58637 (arr!28187 (Array (_ BitVec 32) (_ BitVec 64))) (size!28667 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58636)

(declare-fun array_inv!21931 (array!58636) Bool)

(assert (=> start!82442 (array_inv!21931 _keys!1668)))

(declare-fun array_inv!21932 (array!58634) Bool)

(assert (=> start!82442 (and (array_inv!21932 _values!1386) e!541255)))

(assert (=> start!82442 tp!64603))

(declare-fun b!959997 () Bool)

(declare-fun res!642338 () Bool)

(assert (=> b!959997 (=> (not res!642338) (not e!541254))))

(declare-datatypes ((List!19586 0))(
  ( (Nil!19583) (Cons!19582 (h!20750 (_ BitVec 64)) (t!27941 List!19586)) )
))
(declare-fun arrayNoDuplicates!0 (array!58636 (_ BitVec 32) List!19586) Bool)

(assert (=> b!959997 (= res!642338 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19583))))

(declare-fun b!959998 () Bool)

(declare-fun res!642336 () Bool)

(assert (=> b!959998 (=> (not res!642336) (not e!541254))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959998 (= res!642336 (and (= (size!28666 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28667 _keys!1668) (size!28666 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33859 () Bool)

(declare-fun tp!64602 () Bool)

(assert (=> mapNonEmpty!33859 (= mapRes!33859 (and tp!64602 e!541253))))

(declare-fun mapRest!33859 () (Array (_ BitVec 32) ValueCell!10145))

(declare-fun mapKey!33859 () (_ BitVec 32))

(declare-fun mapValue!33859 () ValueCell!10145)

(assert (=> mapNonEmpty!33859 (= (arr!28186 _values!1386) (store mapRest!33859 mapKey!33859 mapValue!33859))))

(declare-fun b!959999 () Bool)

(declare-fun res!642335 () Bool)

(assert (=> b!959999 (=> (not res!642335) (not e!541254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58636 (_ BitVec 32)) Bool)

(assert (=> b!959999 (= res!642335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960000 () Bool)

(declare-fun res!642340 () Bool)

(assert (=> b!960000 (=> (not res!642340) (not e!541254))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960000 (= res!642340 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28667 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28667 _keys!1668))))))

(declare-fun mapIsEmpty!33859 () Bool)

(assert (=> mapIsEmpty!33859 mapRes!33859))

(declare-fun b!960001 () Bool)

(assert (=> b!960001 (= e!541254 (not true))))

(declare-fun minValue!1328 () V!33321)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33321)

(declare-datatypes ((tuple2!13756 0))(
  ( (tuple2!13757 (_1!6889 (_ BitVec 64)) (_2!6889 V!33321)) )
))
(declare-datatypes ((List!19587 0))(
  ( (Nil!19584) (Cons!19583 (h!20751 tuple2!13756) (t!27942 List!19587)) )
))
(declare-datatypes ((ListLongMap!12455 0))(
  ( (ListLongMap!12456 (toList!6243 List!19587)) )
))
(declare-fun contains!5357 (ListLongMap!12455 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3476 (array!58636 array!58634 (_ BitVec 32) (_ BitVec 32) V!33321 V!33321 (_ BitVec 32) Int) ListLongMap!12455)

(assert (=> b!960001 (contains!5357 (getCurrentListMap!3476 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28187 _keys!1668) i!793))))

(declare-datatypes ((Unit!32140 0))(
  ( (Unit!32141) )
))
(declare-fun lt!430873 () Unit!32140)

(declare-fun lemmaInListMapFromThenInFromSmaller!8 (array!58636 array!58634 (_ BitVec 32) (_ BitVec 32) V!33321 V!33321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32140)

(assert (=> b!960001 (= lt!430873 (lemmaInListMapFromThenInFromSmaller!8 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960002 () Bool)

(declare-fun res!642337 () Bool)

(assert (=> b!960002 (=> (not res!642337) (not e!541254))))

(assert (=> b!960002 (= res!642337 (contains!5357 (getCurrentListMap!3476 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28187 _keys!1668) i!793)))))

(declare-fun b!960003 () Bool)

(assert (=> b!960003 (= e!541256 tp_is_empty!21253)))

(declare-fun b!960004 () Bool)

(declare-fun res!642339 () Bool)

(assert (=> b!960004 (=> (not res!642339) (not e!541254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960004 (= res!642339 (validKeyInArray!0 (select (arr!28187 _keys!1668) i!793)))))

(assert (= (and start!82442 res!642334) b!959998))

(assert (= (and b!959998 res!642336) b!959999))

(assert (= (and b!959999 res!642335) b!959997))

(assert (= (and b!959997 res!642338) b!960000))

(assert (= (and b!960000 res!642340) b!960004))

(assert (= (and b!960004 res!642339) b!960002))

(assert (= (and b!960002 res!642337) b!960001))

(assert (= (and b!959996 condMapEmpty!33859) mapIsEmpty!33859))

(assert (= (and b!959996 (not condMapEmpty!33859)) mapNonEmpty!33859))

(get-info :version)

(assert (= (and mapNonEmpty!33859 ((_ is ValueCellFull!10145) mapValue!33859)) b!959995))

(assert (= (and b!959996 ((_ is ValueCellFull!10145) mapDefault!33859)) b!960003))

(assert (= start!82442 b!959996))

(declare-fun m!890925 () Bool)

(assert (=> b!960001 m!890925))

(declare-fun m!890927 () Bool)

(assert (=> b!960001 m!890927))

(assert (=> b!960001 m!890925))

(assert (=> b!960001 m!890927))

(declare-fun m!890929 () Bool)

(assert (=> b!960001 m!890929))

(declare-fun m!890931 () Bool)

(assert (=> b!960001 m!890931))

(assert (=> b!960004 m!890927))

(assert (=> b!960004 m!890927))

(declare-fun m!890933 () Bool)

(assert (=> b!960004 m!890933))

(declare-fun m!890935 () Bool)

(assert (=> b!959997 m!890935))

(declare-fun m!890937 () Bool)

(assert (=> start!82442 m!890937))

(declare-fun m!890939 () Bool)

(assert (=> start!82442 m!890939))

(declare-fun m!890941 () Bool)

(assert (=> start!82442 m!890941))

(declare-fun m!890943 () Bool)

(assert (=> b!960002 m!890943))

(assert (=> b!960002 m!890927))

(assert (=> b!960002 m!890943))

(assert (=> b!960002 m!890927))

(declare-fun m!890945 () Bool)

(assert (=> b!960002 m!890945))

(declare-fun m!890947 () Bool)

(assert (=> b!959999 m!890947))

(declare-fun m!890949 () Bool)

(assert (=> mapNonEmpty!33859 m!890949))

(check-sat (not b!960004) (not b!960001) tp_is_empty!21253 (not b!960002) (not b!959999) (not mapNonEmpty!33859) b_and!30045 (not start!82442) (not b!959997) (not b_next!18547))
(check-sat b_and!30045 (not b_next!18547))
