; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81928 () Bool)

(assert start!81928)

(declare-fun b_free!18423 () Bool)

(declare-fun b_next!18423 () Bool)

(assert (=> start!81928 (= b_free!18423 (not b_next!18423))))

(declare-fun tp!63968 () Bool)

(declare-fun b_and!29909 () Bool)

(assert (=> start!81928 (= tp!63968 b_and!29909)))

(declare-fun b!955647 () Bool)

(declare-fun e!538363 () Bool)

(declare-fun e!538361 () Bool)

(declare-fun mapRes!33412 () Bool)

(assert (=> b!955647 (= e!538363 (and e!538361 mapRes!33412))))

(declare-fun condMapEmpty!33412 () Bool)

(declare-datatypes ((V!32939 0))(
  ( (V!32940 (val!10534 Int)) )
))
(declare-datatypes ((ValueCell!10002 0))(
  ( (ValueCellFull!10002 (v!13089 V!32939)) (EmptyCell!10002) )
))
(declare-datatypes ((array!58037 0))(
  ( (array!58038 (arr!27898 (Array (_ BitVec 32) ValueCell!10002)) (size!28377 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58037)

(declare-fun mapDefault!33412 () ValueCell!10002)

(assert (=> b!955647 (= condMapEmpty!33412 (= (arr!27898 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10002)) mapDefault!33412)))))

(declare-fun b!955648 () Bool)

(declare-fun res!639961 () Bool)

(declare-fun e!538360 () Bool)

(assert (=> b!955648 (=> (not res!639961) (not e!538360))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58039 0))(
  ( (array!58040 (arr!27899 (Array (_ BitVec 32) (_ BitVec 64))) (size!28378 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58039)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955648 (= res!639961 (and (= (size!28377 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28378 _keys!1441) (size!28377 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33412 () Bool)

(declare-fun tp!63969 () Bool)

(declare-fun e!538362 () Bool)

(assert (=> mapNonEmpty!33412 (= mapRes!33412 (and tp!63969 e!538362))))

(declare-fun mapRest!33412 () (Array (_ BitVec 32) ValueCell!10002))

(declare-fun mapKey!33412 () (_ BitVec 32))

(declare-fun mapValue!33412 () ValueCell!10002)

(assert (=> mapNonEmpty!33412 (= (arr!27898 _values!1197) (store mapRest!33412 mapKey!33412 mapValue!33412))))

(declare-fun b!955649 () Bool)

(declare-fun res!639960 () Bool)

(assert (=> b!955649 (=> (not res!639960) (not e!538360))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955649 (= res!639960 (validKeyInArray!0 (select (arr!27899 _keys!1441) i!735)))))

(declare-fun b!955650 () Bool)

(declare-fun tp_is_empty!20967 () Bool)

(assert (=> b!955650 (= e!538361 tp_is_empty!20967)))

(declare-fun b!955651 () Bool)

(declare-fun res!639962 () Bool)

(assert (=> b!955651 (=> (not res!639962) (not e!538360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58039 (_ BitVec 32)) Bool)

(assert (=> b!955651 (= res!639962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639964 () Bool)

(assert (=> start!81928 (=> (not res!639964) (not e!538360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81928 (= res!639964 (validMask!0 mask!1823))))

(assert (=> start!81928 e!538360))

(assert (=> start!81928 true))

(assert (=> start!81928 tp_is_empty!20967))

(declare-fun array_inv!21649 (array!58039) Bool)

(assert (=> start!81928 (array_inv!21649 _keys!1441)))

(declare-fun array_inv!21650 (array!58037) Bool)

(assert (=> start!81928 (and (array_inv!21650 _values!1197) e!538363)))

(assert (=> start!81928 tp!63968))

(declare-fun mapIsEmpty!33412 () Bool)

(assert (=> mapIsEmpty!33412 mapRes!33412))

(declare-fun b!955652 () Bool)

(assert (=> b!955652 (= e!538360 (not true))))

(declare-fun zeroValue!1139 () V!32939)

(declare-fun minValue!1139 () V!32939)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13670 0))(
  ( (tuple2!13671 (_1!6846 (_ BitVec 64)) (_2!6846 V!32939)) )
))
(declare-datatypes ((List!19444 0))(
  ( (Nil!19441) (Cons!19440 (h!20602 tuple2!13670) (t!27805 List!19444)) )
))
(declare-datatypes ((ListLongMap!12367 0))(
  ( (ListLongMap!12368 (toList!6199 List!19444)) )
))
(declare-fun contains!5297 (ListLongMap!12367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3432 (array!58039 array!58037 (_ BitVec 32) (_ BitVec 32) V!32939 V!32939 (_ BitVec 32) Int) ListLongMap!12367)

(assert (=> b!955652 (contains!5297 (getCurrentListMap!3432 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27899 _keys!1441) i!735))))

(declare-datatypes ((Unit!32119 0))(
  ( (Unit!32120) )
))
(declare-fun lt!430028 () Unit!32119)

(declare-fun lemmaInListMapFromThenFromZero!14 (array!58039 array!58037 (_ BitVec 32) (_ BitVec 32) V!32939 V!32939 (_ BitVec 32) (_ BitVec 32) Int) Unit!32119)

(assert (=> b!955652 (= lt!430028 (lemmaInListMapFromThenFromZero!14 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955653 () Bool)

(declare-fun res!639965 () Bool)

(assert (=> b!955653 (=> (not res!639965) (not e!538360))))

(assert (=> b!955653 (= res!639965 (contains!5297 (getCurrentListMap!3432 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27899 _keys!1441) i!735)))))

(declare-fun b!955654 () Bool)

(declare-fun res!639966 () Bool)

(assert (=> b!955654 (=> (not res!639966) (not e!538360))))

(assert (=> b!955654 (= res!639966 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28378 _keys!1441))))))

(declare-fun b!955655 () Bool)

(assert (=> b!955655 (= e!538362 tp_is_empty!20967)))

(declare-fun b!955656 () Bool)

(declare-fun res!639963 () Bool)

(assert (=> b!955656 (=> (not res!639963) (not e!538360))))

(declare-datatypes ((List!19445 0))(
  ( (Nil!19442) (Cons!19441 (h!20603 (_ BitVec 64)) (t!27806 List!19445)) )
))
(declare-fun arrayNoDuplicates!0 (array!58039 (_ BitVec 32) List!19445) Bool)

(assert (=> b!955656 (= res!639963 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19442))))

(assert (= (and start!81928 res!639964) b!955648))

(assert (= (and b!955648 res!639961) b!955651))

(assert (= (and b!955651 res!639962) b!955656))

(assert (= (and b!955656 res!639963) b!955654))

(assert (= (and b!955654 res!639966) b!955649))

(assert (= (and b!955649 res!639960) b!955653))

(assert (= (and b!955653 res!639965) b!955652))

(assert (= (and b!955647 condMapEmpty!33412) mapIsEmpty!33412))

(assert (= (and b!955647 (not condMapEmpty!33412)) mapNonEmpty!33412))

(get-info :version)

(assert (= (and mapNonEmpty!33412 ((_ is ValueCellFull!10002) mapValue!33412)) b!955655))

(assert (= (and b!955647 ((_ is ValueCellFull!10002) mapDefault!33412)) b!955650))

(assert (= start!81928 b!955647))

(declare-fun m!887137 () Bool)

(assert (=> b!955649 m!887137))

(assert (=> b!955649 m!887137))

(declare-fun m!887139 () Bool)

(assert (=> b!955649 m!887139))

(declare-fun m!887141 () Bool)

(assert (=> b!955653 m!887141))

(assert (=> b!955653 m!887137))

(assert (=> b!955653 m!887141))

(assert (=> b!955653 m!887137))

(declare-fun m!887143 () Bool)

(assert (=> b!955653 m!887143))

(declare-fun m!887145 () Bool)

(assert (=> mapNonEmpty!33412 m!887145))

(declare-fun m!887147 () Bool)

(assert (=> b!955656 m!887147))

(declare-fun m!887149 () Bool)

(assert (=> start!81928 m!887149))

(declare-fun m!887151 () Bool)

(assert (=> start!81928 m!887151))

(declare-fun m!887153 () Bool)

(assert (=> start!81928 m!887153))

(declare-fun m!887155 () Bool)

(assert (=> b!955651 m!887155))

(declare-fun m!887157 () Bool)

(assert (=> b!955652 m!887157))

(assert (=> b!955652 m!887137))

(assert (=> b!955652 m!887157))

(assert (=> b!955652 m!887137))

(declare-fun m!887159 () Bool)

(assert (=> b!955652 m!887159))

(declare-fun m!887161 () Bool)

(assert (=> b!955652 m!887161))

(check-sat (not b!955651) (not mapNonEmpty!33412) tp_is_empty!20967 (not b!955652) (not b!955649) b_and!29909 (not start!81928) (not b!955656) (not b!955653) (not b_next!18423))
(check-sat b_and!29909 (not b_next!18423))
