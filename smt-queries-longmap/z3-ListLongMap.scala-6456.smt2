; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82558 () Bool)

(assert start!82558)

(declare-fun b_free!18709 () Bool)

(declare-fun b_next!18709 () Bool)

(assert (=> start!82558 (= b_free!18709 (not b_next!18709))))

(declare-fun tp!65247 () Bool)

(declare-fun b_and!30171 () Bool)

(assert (=> start!82558 (= tp!65247 b_and!30171)))

(declare-fun b!962118 () Bool)

(declare-fun res!643925 () Bool)

(declare-fun e!542554 () Bool)

(assert (=> b!962118 (=> (not res!643925) (not e!542554))))

(declare-datatypes ((array!59048 0))(
  ( (array!59049 (arr!28393 (Array (_ BitVec 32) (_ BitVec 64))) (size!28874 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59048)

(declare-datatypes ((List!19746 0))(
  ( (Nil!19743) (Cons!19742 (h!20904 (_ BitVec 64)) (t!28100 List!19746)) )
))
(declare-fun arrayNoDuplicates!0 (array!59048 (_ BitVec 32) List!19746) Bool)

(assert (=> b!962118 (= res!643925 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19743))))

(declare-fun mapIsEmpty!34261 () Bool)

(declare-fun mapRes!34261 () Bool)

(assert (=> mapIsEmpty!34261 mapRes!34261))

(declare-fun b!962119 () Bool)

(declare-fun e!542556 () Bool)

(declare-fun e!542553 () Bool)

(assert (=> b!962119 (= e!542556 (and e!542553 mapRes!34261))))

(declare-fun condMapEmpty!34261 () Bool)

(declare-datatypes ((V!33665 0))(
  ( (V!33666 (val!10806 Int)) )
))
(declare-datatypes ((ValueCell!10274 0))(
  ( (ValueCellFull!10274 (v!13363 V!33665)) (EmptyCell!10274) )
))
(declare-datatypes ((array!59050 0))(
  ( (array!59051 (arr!28394 (Array (_ BitVec 32) ValueCell!10274)) (size!28875 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59050)

(declare-fun mapDefault!34261 () ValueCell!10274)

(assert (=> b!962119 (= condMapEmpty!34261 (= (arr!28394 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10274)) mapDefault!34261)))))

(declare-fun b!962120 () Bool)

(declare-fun res!643923 () Bool)

(assert (=> b!962120 (=> (not res!643923) (not e!542554))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59048 (_ BitVec 32)) Bool)

(assert (=> b!962120 (= res!643923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962121 () Bool)

(declare-fun res!643920 () Bool)

(assert (=> b!962121 (=> (not res!643920) (not e!542554))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962121 (= res!643920 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28874 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28874 _keys!1686))))))

(declare-fun res!643922 () Bool)

(assert (=> start!82558 (=> (not res!643922) (not e!542554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82558 (= res!643922 (validMask!0 mask!2110))))

(assert (=> start!82558 e!542554))

(assert (=> start!82558 true))

(declare-fun array_inv!22059 (array!59050) Bool)

(assert (=> start!82558 (and (array_inv!22059 _values!1400) e!542556)))

(declare-fun array_inv!22060 (array!59048) Bool)

(assert (=> start!82558 (array_inv!22060 _keys!1686)))

(assert (=> start!82558 tp!65247))

(declare-fun tp_is_empty!21511 () Bool)

(assert (=> start!82558 tp_is_empty!21511))

(declare-fun b!962122 () Bool)

(assert (=> b!962122 (= e!542554 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33665)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430631 () Bool)

(declare-fun zeroValue!1342 () V!33665)

(declare-datatypes ((tuple2!13938 0))(
  ( (tuple2!13939 (_1!6980 (_ BitVec 64)) (_2!6980 V!33665)) )
))
(declare-datatypes ((List!19747 0))(
  ( (Nil!19744) (Cons!19743 (h!20905 tuple2!13938) (t!28101 List!19747)) )
))
(declare-datatypes ((ListLongMap!12625 0))(
  ( (ListLongMap!12626 (toList!6328 List!19747)) )
))
(declare-fun contains!5375 (ListLongMap!12625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3490 (array!59048 array!59050 (_ BitVec 32) (_ BitVec 32) V!33665 V!33665 (_ BitVec 32) Int) ListLongMap!12625)

(assert (=> b!962122 (= lt!430631 (contains!5375 (getCurrentListMap!3490 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28393 _keys!1686) i!803)))))

(declare-fun b!962123 () Bool)

(declare-fun res!643924 () Bool)

(assert (=> b!962123 (=> (not res!643924) (not e!542554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962123 (= res!643924 (validKeyInArray!0 (select (arr!28393 _keys!1686) i!803)))))

(declare-fun b!962124 () Bool)

(assert (=> b!962124 (= e!542553 tp_is_empty!21511)))

(declare-fun mapNonEmpty!34261 () Bool)

(declare-fun tp!65248 () Bool)

(declare-fun e!542555 () Bool)

(assert (=> mapNonEmpty!34261 (= mapRes!34261 (and tp!65248 e!542555))))

(declare-fun mapRest!34261 () (Array (_ BitVec 32) ValueCell!10274))

(declare-fun mapValue!34261 () ValueCell!10274)

(declare-fun mapKey!34261 () (_ BitVec 32))

(assert (=> mapNonEmpty!34261 (= (arr!28394 _values!1400) (store mapRest!34261 mapKey!34261 mapValue!34261))))

(declare-fun b!962125 () Bool)

(assert (=> b!962125 (= e!542555 tp_is_empty!21511)))

(declare-fun b!962126 () Bool)

(declare-fun res!643921 () Bool)

(assert (=> b!962126 (=> (not res!643921) (not e!542554))))

(assert (=> b!962126 (= res!643921 (and (= (size!28875 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28874 _keys!1686) (size!28875 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82558 res!643922) b!962126))

(assert (= (and b!962126 res!643921) b!962120))

(assert (= (and b!962120 res!643923) b!962118))

(assert (= (and b!962118 res!643925) b!962121))

(assert (= (and b!962121 res!643920) b!962123))

(assert (= (and b!962123 res!643924) b!962122))

(assert (= (and b!962119 condMapEmpty!34261) mapIsEmpty!34261))

(assert (= (and b!962119 (not condMapEmpty!34261)) mapNonEmpty!34261))

(get-info :version)

(assert (= (and mapNonEmpty!34261 ((_ is ValueCellFull!10274) mapValue!34261)) b!962125))

(assert (= (and b!962119 ((_ is ValueCellFull!10274) mapDefault!34261)) b!962124))

(assert (= start!82558 b!962119))

(declare-fun m!891271 () Bool)

(assert (=> mapNonEmpty!34261 m!891271))

(declare-fun m!891273 () Bool)

(assert (=> b!962123 m!891273))

(assert (=> b!962123 m!891273))

(declare-fun m!891275 () Bool)

(assert (=> b!962123 m!891275))

(declare-fun m!891277 () Bool)

(assert (=> start!82558 m!891277))

(declare-fun m!891279 () Bool)

(assert (=> start!82558 m!891279))

(declare-fun m!891281 () Bool)

(assert (=> start!82558 m!891281))

(declare-fun m!891283 () Bool)

(assert (=> b!962122 m!891283))

(assert (=> b!962122 m!891273))

(assert (=> b!962122 m!891283))

(assert (=> b!962122 m!891273))

(declare-fun m!891285 () Bool)

(assert (=> b!962122 m!891285))

(declare-fun m!891287 () Bool)

(assert (=> b!962120 m!891287))

(declare-fun m!891289 () Bool)

(assert (=> b!962118 m!891289))

(check-sat (not b!962120) (not b_next!18709) (not mapNonEmpty!34261) tp_is_empty!21511 (not b!962122) (not start!82558) b_and!30171 (not b!962123) (not b!962118))
(check-sat b_and!30171 (not b_next!18709))
