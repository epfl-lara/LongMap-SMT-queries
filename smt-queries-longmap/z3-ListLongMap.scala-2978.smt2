; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42146 () Bool)

(assert start!42146)

(declare-fun b_free!11679 () Bool)

(declare-fun b_next!11679 () Bool)

(assert (=> start!42146 (= b_free!11679 (not b_next!11679))))

(declare-fun tp!41059 () Bool)

(declare-fun b_and!20101 () Bool)

(assert (=> start!42146 (= tp!41059 b_and!20101)))

(declare-fun b!470510 () Bool)

(declare-fun res!281139 () Bool)

(declare-fun e!275648 () Bool)

(assert (=> b!470510 (=> (not res!281139) (not e!275648))))

(declare-datatypes ((array!29985 0))(
  ( (array!29986 (arr!14416 (Array (_ BitVec 32) (_ BitVec 64))) (size!14768 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29985)

(declare-datatypes ((List!8772 0))(
  ( (Nil!8769) (Cons!8768 (h!9624 (_ BitVec 64)) (t!14734 List!8772)) )
))
(declare-fun arrayNoDuplicates!0 (array!29985 (_ BitVec 32) List!8772) Bool)

(assert (=> b!470510 (= res!281139 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8769))))

(declare-fun b!470511 () Bool)

(assert (=> b!470511 (= e!275648 (not true))))

(declare-datatypes ((V!18581 0))(
  ( (V!18582 (val!6598 Int)) )
))
(declare-datatypes ((tuple2!8692 0))(
  ( (tuple2!8693 (_1!4357 (_ BitVec 64)) (_2!4357 V!18581)) )
))
(declare-datatypes ((List!8773 0))(
  ( (Nil!8770) (Cons!8769 (h!9625 tuple2!8692) (t!14735 List!8773)) )
))
(declare-datatypes ((ListLongMap!7605 0))(
  ( (ListLongMap!7606 (toList!3818 List!8773)) )
))
(declare-fun lt!213486 () ListLongMap!7605)

(declare-fun lt!213484 () ListLongMap!7605)

(assert (=> b!470511 (= lt!213486 lt!213484)))

(declare-fun zeroValue!794 () V!18581)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18581)

(declare-datatypes ((ValueCell!6210 0))(
  ( (ValueCellFull!6210 (v!8889 V!18581)) (EmptyCell!6210) )
))
(declare-datatypes ((array!29987 0))(
  ( (array!29988 (arr!14417 (Array (_ BitVec 32) ValueCell!6210)) (size!14769 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29987)

(declare-fun minValueAfter!38 () V!18581)

(declare-datatypes ((Unit!13795 0))(
  ( (Unit!13796) )
))
(declare-fun lt!213485 () Unit!13795)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!161 (array!29985 array!29987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18581 V!18581 V!18581 V!18581 (_ BitVec 32) Int) Unit!13795)

(assert (=> b!470511 (= lt!213485 (lemmaNoChangeToArrayThenSameMapNoExtras!161 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1981 (array!29985 array!29987 (_ BitVec 32) (_ BitVec 32) V!18581 V!18581 (_ BitVec 32) Int) ListLongMap!7605)

(assert (=> b!470511 (= lt!213484 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470511 (= lt!213486 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470512 () Bool)

(declare-fun res!281141 () Bool)

(assert (=> b!470512 (=> (not res!281141) (not e!275648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29985 (_ BitVec 32)) Bool)

(assert (=> b!470512 (= res!281141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470513 () Bool)

(declare-fun res!281140 () Bool)

(assert (=> b!470513 (=> (not res!281140) (not e!275648))))

(assert (=> b!470513 (= res!281140 (and (= (size!14769 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14768 _keys!1025) (size!14769 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470514 () Bool)

(declare-fun e!275647 () Bool)

(declare-fun tp_is_empty!13107 () Bool)

(assert (=> b!470514 (= e!275647 tp_is_empty!13107)))

(declare-fun mapNonEmpty!21361 () Bool)

(declare-fun mapRes!21361 () Bool)

(declare-fun tp!41058 () Bool)

(declare-fun e!275650 () Bool)

(assert (=> mapNonEmpty!21361 (= mapRes!21361 (and tp!41058 e!275650))))

(declare-fun mapRest!21361 () (Array (_ BitVec 32) ValueCell!6210))

(declare-fun mapValue!21361 () ValueCell!6210)

(declare-fun mapKey!21361 () (_ BitVec 32))

(assert (=> mapNonEmpty!21361 (= (arr!14417 _values!833) (store mapRest!21361 mapKey!21361 mapValue!21361))))

(declare-fun b!470515 () Bool)

(assert (=> b!470515 (= e!275650 tp_is_empty!13107)))

(declare-fun res!281142 () Bool)

(assert (=> start!42146 (=> (not res!281142) (not e!275648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42146 (= res!281142 (validMask!0 mask!1365))))

(assert (=> start!42146 e!275648))

(assert (=> start!42146 tp_is_empty!13107))

(assert (=> start!42146 tp!41059))

(assert (=> start!42146 true))

(declare-fun array_inv!10404 (array!29985) Bool)

(assert (=> start!42146 (array_inv!10404 _keys!1025)))

(declare-fun e!275649 () Bool)

(declare-fun array_inv!10405 (array!29987) Bool)

(assert (=> start!42146 (and (array_inv!10405 _values!833) e!275649)))

(declare-fun mapIsEmpty!21361 () Bool)

(assert (=> mapIsEmpty!21361 mapRes!21361))

(declare-fun b!470516 () Bool)

(assert (=> b!470516 (= e!275649 (and e!275647 mapRes!21361))))

(declare-fun condMapEmpty!21361 () Bool)

(declare-fun mapDefault!21361 () ValueCell!6210)

(assert (=> b!470516 (= condMapEmpty!21361 (= (arr!14417 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6210)) mapDefault!21361)))))

(assert (= (and start!42146 res!281142) b!470513))

(assert (= (and b!470513 res!281140) b!470512))

(assert (= (and b!470512 res!281141) b!470510))

(assert (= (and b!470510 res!281139) b!470511))

(assert (= (and b!470516 condMapEmpty!21361) mapIsEmpty!21361))

(assert (= (and b!470516 (not condMapEmpty!21361)) mapNonEmpty!21361))

(get-info :version)

(assert (= (and mapNonEmpty!21361 ((_ is ValueCellFull!6210) mapValue!21361)) b!470515))

(assert (= (and b!470516 ((_ is ValueCellFull!6210) mapDefault!21361)) b!470514))

(assert (= start!42146 b!470516))

(declare-fun m!452789 () Bool)

(assert (=> b!470511 m!452789))

(declare-fun m!452791 () Bool)

(assert (=> b!470511 m!452791))

(declare-fun m!452793 () Bool)

(assert (=> b!470511 m!452793))

(declare-fun m!452795 () Bool)

(assert (=> b!470510 m!452795))

(declare-fun m!452797 () Bool)

(assert (=> start!42146 m!452797))

(declare-fun m!452799 () Bool)

(assert (=> start!42146 m!452799))

(declare-fun m!452801 () Bool)

(assert (=> start!42146 m!452801))

(declare-fun m!452803 () Bool)

(assert (=> mapNonEmpty!21361 m!452803))

(declare-fun m!452805 () Bool)

(assert (=> b!470512 m!452805))

(check-sat (not start!42146) (not b!470511) (not b_next!11679) b_and!20101 (not mapNonEmpty!21361) (not b!470510) tp_is_empty!13107 (not b!470512))
(check-sat b_and!20101 (not b_next!11679))
