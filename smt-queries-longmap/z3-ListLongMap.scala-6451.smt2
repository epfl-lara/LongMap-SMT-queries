; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82528 () Bool)

(assert start!82528)

(declare-fun b_free!18679 () Bool)

(declare-fun b_next!18679 () Bool)

(assert (=> start!82528 (= b_free!18679 (not b_next!18679))))

(declare-fun tp!65157 () Bool)

(declare-fun b_and!30141 () Bool)

(assert (=> start!82528 (= tp!65157 b_and!30141)))

(declare-fun b!961713 () Bool)

(declare-fun res!643653 () Bool)

(declare-fun e!542331 () Bool)

(assert (=> b!961713 (=> (not res!643653) (not e!542331))))

(declare-datatypes ((array!58990 0))(
  ( (array!58991 (arr!28364 (Array (_ BitVec 32) (_ BitVec 64))) (size!28845 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58990)

(declare-datatypes ((List!19724 0))(
  ( (Nil!19721) (Cons!19720 (h!20882 (_ BitVec 64)) (t!28078 List!19724)) )
))
(declare-fun arrayNoDuplicates!0 (array!58990 (_ BitVec 32) List!19724) Bool)

(assert (=> b!961713 (= res!643653 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19721))))

(declare-fun b!961714 () Bool)

(declare-fun res!643651 () Bool)

(assert (=> b!961714 (=> (not res!643651) (not e!542331))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961714 (= res!643651 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28845 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28845 _keys!1686))))))

(declare-fun b!961715 () Bool)

(declare-fun e!542329 () Bool)

(declare-fun tp_is_empty!21481 () Bool)

(assert (=> b!961715 (= e!542329 tp_is_empty!21481)))

(declare-fun res!643654 () Bool)

(assert (=> start!82528 (=> (not res!643654) (not e!542331))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82528 (= res!643654 (validMask!0 mask!2110))))

(assert (=> start!82528 e!542331))

(assert (=> start!82528 true))

(declare-datatypes ((V!33625 0))(
  ( (V!33626 (val!10791 Int)) )
))
(declare-datatypes ((ValueCell!10259 0))(
  ( (ValueCellFull!10259 (v!13348 V!33625)) (EmptyCell!10259) )
))
(declare-datatypes ((array!58992 0))(
  ( (array!58993 (arr!28365 (Array (_ BitVec 32) ValueCell!10259)) (size!28846 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58992)

(declare-fun e!542332 () Bool)

(declare-fun array_inv!22037 (array!58992) Bool)

(assert (=> start!82528 (and (array_inv!22037 _values!1400) e!542332)))

(declare-fun array_inv!22038 (array!58990) Bool)

(assert (=> start!82528 (array_inv!22038 _keys!1686)))

(assert (=> start!82528 tp!65157))

(assert (=> start!82528 tp_is_empty!21481))

(declare-fun b!961716 () Bool)

(declare-fun res!643650 () Bool)

(assert (=> b!961716 (=> (not res!643650) (not e!542331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961716 (= res!643650 (validKeyInArray!0 (select (arr!28364 _keys!1686) i!803)))))

(declare-fun b!961717 () Bool)

(declare-fun res!643655 () Bool)

(assert (=> b!961717 (=> (not res!643655) (not e!542331))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961717 (= res!643655 (and (= (size!28846 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28845 _keys!1686) (size!28846 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34216 () Bool)

(declare-fun mapRes!34216 () Bool)

(assert (=> mapIsEmpty!34216 mapRes!34216))

(declare-fun b!961718 () Bool)

(declare-fun e!542330 () Bool)

(assert (=> b!961718 (= e!542332 (and e!542330 mapRes!34216))))

(declare-fun condMapEmpty!34216 () Bool)

(declare-fun mapDefault!34216 () ValueCell!10259)

(assert (=> b!961718 (= condMapEmpty!34216 (= (arr!28365 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10259)) mapDefault!34216)))))

(declare-fun b!961719 () Bool)

(declare-fun res!643652 () Bool)

(assert (=> b!961719 (=> (not res!643652) (not e!542331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58990 (_ BitVec 32)) Bool)

(assert (=> b!961719 (= res!643652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961720 () Bool)

(assert (=> b!961720 (= e!542330 tp_is_empty!21481)))

(declare-fun b!961721 () Bool)

(assert (=> b!961721 (= e!542331 false)))

(declare-fun minValue!1342 () V!33625)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33625)

(declare-fun lt!430586 () Bool)

(declare-datatypes ((tuple2!13916 0))(
  ( (tuple2!13917 (_1!6969 (_ BitVec 64)) (_2!6969 V!33625)) )
))
(declare-datatypes ((List!19725 0))(
  ( (Nil!19722) (Cons!19721 (h!20883 tuple2!13916) (t!28079 List!19725)) )
))
(declare-datatypes ((ListLongMap!12603 0))(
  ( (ListLongMap!12604 (toList!6317 List!19725)) )
))
(declare-fun contains!5364 (ListLongMap!12603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3479 (array!58990 array!58992 (_ BitVec 32) (_ BitVec 32) V!33625 V!33625 (_ BitVec 32) Int) ListLongMap!12603)

(assert (=> b!961721 (= lt!430586 (contains!5364 (getCurrentListMap!3479 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28364 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34216 () Bool)

(declare-fun tp!65158 () Bool)

(assert (=> mapNonEmpty!34216 (= mapRes!34216 (and tp!65158 e!542329))))

(declare-fun mapRest!34216 () (Array (_ BitVec 32) ValueCell!10259))

(declare-fun mapKey!34216 () (_ BitVec 32))

(declare-fun mapValue!34216 () ValueCell!10259)

(assert (=> mapNonEmpty!34216 (= (arr!28365 _values!1400) (store mapRest!34216 mapKey!34216 mapValue!34216))))

(assert (= (and start!82528 res!643654) b!961717))

(assert (= (and b!961717 res!643655) b!961719))

(assert (= (and b!961719 res!643652) b!961713))

(assert (= (and b!961713 res!643653) b!961714))

(assert (= (and b!961714 res!643651) b!961716))

(assert (= (and b!961716 res!643650) b!961721))

(assert (= (and b!961718 condMapEmpty!34216) mapIsEmpty!34216))

(assert (= (and b!961718 (not condMapEmpty!34216)) mapNonEmpty!34216))

(get-info :version)

(assert (= (and mapNonEmpty!34216 ((_ is ValueCellFull!10259) mapValue!34216)) b!961715))

(assert (= (and b!961718 ((_ is ValueCellFull!10259) mapDefault!34216)) b!961720))

(assert (= start!82528 b!961718))

(declare-fun m!890971 () Bool)

(assert (=> start!82528 m!890971))

(declare-fun m!890973 () Bool)

(assert (=> start!82528 m!890973))

(declare-fun m!890975 () Bool)

(assert (=> start!82528 m!890975))

(declare-fun m!890977 () Bool)

(assert (=> b!961713 m!890977))

(declare-fun m!890979 () Bool)

(assert (=> b!961716 m!890979))

(assert (=> b!961716 m!890979))

(declare-fun m!890981 () Bool)

(assert (=> b!961716 m!890981))

(declare-fun m!890983 () Bool)

(assert (=> b!961719 m!890983))

(declare-fun m!890985 () Bool)

(assert (=> b!961721 m!890985))

(assert (=> b!961721 m!890979))

(assert (=> b!961721 m!890985))

(assert (=> b!961721 m!890979))

(declare-fun m!890987 () Bool)

(assert (=> b!961721 m!890987))

(declare-fun m!890989 () Bool)

(assert (=> mapNonEmpty!34216 m!890989))

(check-sat (not b_next!18679) (not b!961716) (not b!961721) (not b!961719) tp_is_empty!21481 (not mapNonEmpty!34216) (not start!82528) b_and!30141 (not b!961713))
(check-sat b_and!30141 (not b_next!18679))
