; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82560 () Bool)

(assert start!82560)

(declare-fun b_free!18693 () Bool)

(declare-fun b_next!18693 () Bool)

(assert (=> start!82560 (= b_free!18693 (not b_next!18693))))

(declare-fun tp!65199 () Bool)

(declare-fun b_and!30181 () Bool)

(assert (=> start!82560 (= tp!65199 b_and!30181)))

(declare-fun res!643888 () Bool)

(declare-fun e!542582 () Bool)

(assert (=> start!82560 (=> (not res!643888) (not e!542582))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82560 (= res!643888 (validMask!0 mask!2110))))

(assert (=> start!82560 e!542582))

(assert (=> start!82560 true))

(declare-datatypes ((V!33643 0))(
  ( (V!33644 (val!10798 Int)) )
))
(declare-datatypes ((ValueCell!10266 0))(
  ( (ValueCellFull!10266 (v!13356 V!33643)) (EmptyCell!10266) )
))
(declare-datatypes ((array!59087 0))(
  ( (array!59088 (arr!28412 (Array (_ BitVec 32) ValueCell!10266)) (size!28891 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59087)

(declare-fun e!542581 () Bool)

(declare-fun array_inv!22019 (array!59087) Bool)

(assert (=> start!82560 (and (array_inv!22019 _values!1400) e!542581)))

(declare-datatypes ((array!59089 0))(
  ( (array!59090 (arr!28413 (Array (_ BitVec 32) (_ BitVec 64))) (size!28892 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59089)

(declare-fun array_inv!22020 (array!59089) Bool)

(assert (=> start!82560 (array_inv!22020 _keys!1686)))

(assert (=> start!82560 tp!65199))

(declare-fun tp_is_empty!21495 () Bool)

(assert (=> start!82560 tp_is_empty!21495))

(declare-fun b!962141 () Bool)

(declare-fun res!643887 () Bool)

(assert (=> b!962141 (=> (not res!643887) (not e!542582))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962141 (= res!643887 (validKeyInArray!0 (select (arr!28413 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34237 () Bool)

(declare-fun mapRes!34237 () Bool)

(assert (=> mapIsEmpty!34237 mapRes!34237))

(declare-fun b!962142 () Bool)

(declare-fun e!542584 () Bool)

(assert (=> b!962142 (= e!542584 tp_is_empty!21495)))

(declare-fun b!962143 () Bool)

(assert (=> b!962143 (= e!542582 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!430843 () Bool)

(declare-fun minValue!1342 () V!33643)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33643)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13870 0))(
  ( (tuple2!13871 (_1!6946 (_ BitVec 64)) (_2!6946 V!33643)) )
))
(declare-datatypes ((List!19719 0))(
  ( (Nil!19716) (Cons!19715 (h!20877 tuple2!13870) (t!28082 List!19719)) )
))
(declare-datatypes ((ListLongMap!12567 0))(
  ( (ListLongMap!12568 (toList!6299 List!19719)) )
))
(declare-fun contains!5402 (ListLongMap!12567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3532 (array!59089 array!59087 (_ BitVec 32) (_ BitVec 32) V!33643 V!33643 (_ BitVec 32) Int) ListLongMap!12567)

(assert (=> b!962143 (= lt!430843 (contains!5402 (getCurrentListMap!3532 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28413 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34237 () Bool)

(declare-fun tp!65198 () Bool)

(assert (=> mapNonEmpty!34237 (= mapRes!34237 (and tp!65198 e!542584))))

(declare-fun mapRest!34237 () (Array (_ BitVec 32) ValueCell!10266))

(declare-fun mapKey!34237 () (_ BitVec 32))

(declare-fun mapValue!34237 () ValueCell!10266)

(assert (=> mapNonEmpty!34237 (= (arr!28412 _values!1400) (store mapRest!34237 mapKey!34237 mapValue!34237))))

(declare-fun b!962144 () Bool)

(declare-fun res!643891 () Bool)

(assert (=> b!962144 (=> (not res!643891) (not e!542582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59089 (_ BitVec 32)) Bool)

(assert (=> b!962144 (= res!643891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962145 () Bool)

(declare-fun res!643886 () Bool)

(assert (=> b!962145 (=> (not res!643886) (not e!542582))))

(declare-datatypes ((List!19720 0))(
  ( (Nil!19717) (Cons!19716 (h!20878 (_ BitVec 64)) (t!28083 List!19720)) )
))
(declare-fun arrayNoDuplicates!0 (array!59089 (_ BitVec 32) List!19720) Bool)

(assert (=> b!962145 (= res!643886 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19717))))

(declare-fun b!962146 () Bool)

(declare-fun e!542585 () Bool)

(assert (=> b!962146 (= e!542581 (and e!542585 mapRes!34237))))

(declare-fun condMapEmpty!34237 () Bool)

(declare-fun mapDefault!34237 () ValueCell!10266)

(assert (=> b!962146 (= condMapEmpty!34237 (= (arr!28412 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10266)) mapDefault!34237)))))

(declare-fun b!962147 () Bool)

(declare-fun res!643890 () Bool)

(assert (=> b!962147 (=> (not res!643890) (not e!542582))))

(assert (=> b!962147 (= res!643890 (and (= (size!28891 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28892 _keys!1686) (size!28891 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962148 () Bool)

(declare-fun res!643889 () Bool)

(assert (=> b!962148 (=> (not res!643889) (not e!542582))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962148 (= res!643889 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28892 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28892 _keys!1686))))))

(declare-fun b!962149 () Bool)

(assert (=> b!962149 (= e!542585 tp_is_empty!21495)))

(assert (= (and start!82560 res!643888) b!962147))

(assert (= (and b!962147 res!643890) b!962144))

(assert (= (and b!962144 res!643891) b!962145))

(assert (= (and b!962145 res!643886) b!962148))

(assert (= (and b!962148 res!643889) b!962141))

(assert (= (and b!962141 res!643887) b!962143))

(assert (= (and b!962146 condMapEmpty!34237) mapIsEmpty!34237))

(assert (= (and b!962146 (not condMapEmpty!34237)) mapNonEmpty!34237))

(get-info :version)

(assert (= (and mapNonEmpty!34237 ((_ is ValueCellFull!10266) mapValue!34237)) b!962142))

(assert (= (and b!962146 ((_ is ValueCellFull!10266) mapDefault!34237)) b!962149))

(assert (= start!82560 b!962146))

(declare-fun m!891869 () Bool)

(assert (=> b!962145 m!891869))

(declare-fun m!891871 () Bool)

(assert (=> b!962143 m!891871))

(declare-fun m!891873 () Bool)

(assert (=> b!962143 m!891873))

(assert (=> b!962143 m!891871))

(assert (=> b!962143 m!891873))

(declare-fun m!891875 () Bool)

(assert (=> b!962143 m!891875))

(declare-fun m!891877 () Bool)

(assert (=> b!962144 m!891877))

(declare-fun m!891879 () Bool)

(assert (=> start!82560 m!891879))

(declare-fun m!891881 () Bool)

(assert (=> start!82560 m!891881))

(declare-fun m!891883 () Bool)

(assert (=> start!82560 m!891883))

(assert (=> b!962141 m!891873))

(assert (=> b!962141 m!891873))

(declare-fun m!891885 () Bool)

(assert (=> b!962141 m!891885))

(declare-fun m!891887 () Bool)

(assert (=> mapNonEmpty!34237 m!891887))

(check-sat (not b!962141) b_and!30181 (not b!962143) (not b_next!18693) tp_is_empty!21495 (not mapNonEmpty!34237) (not b!962145) (not start!82560) (not b!962144))
(check-sat b_and!30181 (not b_next!18693))
