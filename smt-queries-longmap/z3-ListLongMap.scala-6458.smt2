; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82570 () Bool)

(assert start!82570)

(declare-fun b_free!18721 () Bool)

(declare-fun b_next!18721 () Bool)

(assert (=> start!82570 (= b_free!18721 (not b_next!18721))))

(declare-fun tp!65284 () Bool)

(declare-fun b_and!30183 () Bool)

(assert (=> start!82570 (= tp!65284 b_and!30183)))

(declare-fun b!962280 () Bool)

(declare-fun res!644030 () Bool)

(declare-fun e!542647 () Bool)

(assert (=> b!962280 (=> (not res!644030) (not e!542647))))

(declare-datatypes ((array!59072 0))(
  ( (array!59073 (arr!28405 (Array (_ BitVec 32) (_ BitVec 64))) (size!28886 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59072)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59072 (_ BitVec 32)) Bool)

(assert (=> b!962280 (= res!644030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962281 () Bool)

(declare-fun e!542643 () Bool)

(declare-fun tp_is_empty!21523 () Bool)

(assert (=> b!962281 (= e!542643 tp_is_empty!21523)))

(declare-fun b!962282 () Bool)

(declare-fun res!644033 () Bool)

(assert (=> b!962282 (=> (not res!644033) (not e!542647))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962282 (= res!644033 (validKeyInArray!0 (select (arr!28405 _keys!1686) i!803)))))

(declare-fun res!644032 () Bool)

(assert (=> start!82570 (=> (not res!644032) (not e!542647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82570 (= res!644032 (validMask!0 mask!2110))))

(assert (=> start!82570 e!542647))

(assert (=> start!82570 true))

(declare-datatypes ((V!33681 0))(
  ( (V!33682 (val!10812 Int)) )
))
(declare-datatypes ((ValueCell!10280 0))(
  ( (ValueCellFull!10280 (v!13369 V!33681)) (EmptyCell!10280) )
))
(declare-datatypes ((array!59074 0))(
  ( (array!59075 (arr!28406 (Array (_ BitVec 32) ValueCell!10280)) (size!28887 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59074)

(declare-fun e!542644 () Bool)

(declare-fun array_inv!22069 (array!59074) Bool)

(assert (=> start!82570 (and (array_inv!22069 _values!1400) e!542644)))

(declare-fun array_inv!22070 (array!59072) Bool)

(assert (=> start!82570 (array_inv!22070 _keys!1686)))

(assert (=> start!82570 tp!65284))

(assert (=> start!82570 tp_is_empty!21523))

(declare-fun b!962283 () Bool)

(declare-fun e!542646 () Bool)

(assert (=> b!962283 (= e!542646 tp_is_empty!21523)))

(declare-fun b!962284 () Bool)

(assert (=> b!962284 (= e!542647 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33681)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33681)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun lt!430649 () Bool)

(declare-datatypes ((tuple2!13944 0))(
  ( (tuple2!13945 (_1!6983 (_ BitVec 64)) (_2!6983 V!33681)) )
))
(declare-datatypes ((List!19754 0))(
  ( (Nil!19751) (Cons!19750 (h!20912 tuple2!13944) (t!28108 List!19754)) )
))
(declare-datatypes ((ListLongMap!12631 0))(
  ( (ListLongMap!12632 (toList!6331 List!19754)) )
))
(declare-fun contains!5378 (ListLongMap!12631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3493 (array!59072 array!59074 (_ BitVec 32) (_ BitVec 32) V!33681 V!33681 (_ BitVec 32) Int) ListLongMap!12631)

(assert (=> b!962284 (= lt!430649 (contains!5378 (getCurrentListMap!3493 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28405 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34279 () Bool)

(declare-fun mapRes!34279 () Bool)

(assert (=> mapIsEmpty!34279 mapRes!34279))

(declare-fun mapNonEmpty!34279 () Bool)

(declare-fun tp!65283 () Bool)

(assert (=> mapNonEmpty!34279 (= mapRes!34279 (and tp!65283 e!542646))))

(declare-fun mapRest!34279 () (Array (_ BitVec 32) ValueCell!10280))

(declare-fun mapValue!34279 () ValueCell!10280)

(declare-fun mapKey!34279 () (_ BitVec 32))

(assert (=> mapNonEmpty!34279 (= (arr!28406 _values!1400) (store mapRest!34279 mapKey!34279 mapValue!34279))))

(declare-fun b!962285 () Bool)

(declare-fun res!644029 () Bool)

(assert (=> b!962285 (=> (not res!644029) (not e!542647))))

(assert (=> b!962285 (= res!644029 (and (= (size!28887 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28886 _keys!1686) (size!28887 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962286 () Bool)

(declare-fun res!644031 () Bool)

(assert (=> b!962286 (=> (not res!644031) (not e!542647))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962286 (= res!644031 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28886 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28886 _keys!1686))))))

(declare-fun b!962287 () Bool)

(declare-fun res!644028 () Bool)

(assert (=> b!962287 (=> (not res!644028) (not e!542647))))

(declare-datatypes ((List!19755 0))(
  ( (Nil!19752) (Cons!19751 (h!20913 (_ BitVec 64)) (t!28109 List!19755)) )
))
(declare-fun arrayNoDuplicates!0 (array!59072 (_ BitVec 32) List!19755) Bool)

(assert (=> b!962287 (= res!644028 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19752))))

(declare-fun b!962288 () Bool)

(assert (=> b!962288 (= e!542644 (and e!542643 mapRes!34279))))

(declare-fun condMapEmpty!34279 () Bool)

(declare-fun mapDefault!34279 () ValueCell!10280)

(assert (=> b!962288 (= condMapEmpty!34279 (= (arr!28406 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10280)) mapDefault!34279)))))

(assert (= (and start!82570 res!644032) b!962285))

(assert (= (and b!962285 res!644029) b!962280))

(assert (= (and b!962280 res!644030) b!962287))

(assert (= (and b!962287 res!644028) b!962286))

(assert (= (and b!962286 res!644031) b!962282))

(assert (= (and b!962282 res!644033) b!962284))

(assert (= (and b!962288 condMapEmpty!34279) mapIsEmpty!34279))

(assert (= (and b!962288 (not condMapEmpty!34279)) mapNonEmpty!34279))

(get-info :version)

(assert (= (and mapNonEmpty!34279 ((_ is ValueCellFull!10280) mapValue!34279)) b!962283))

(assert (= (and b!962288 ((_ is ValueCellFull!10280) mapDefault!34279)) b!962281))

(assert (= start!82570 b!962288))

(declare-fun m!891391 () Bool)

(assert (=> mapNonEmpty!34279 m!891391))

(declare-fun m!891393 () Bool)

(assert (=> b!962287 m!891393))

(declare-fun m!891395 () Bool)

(assert (=> b!962282 m!891395))

(assert (=> b!962282 m!891395))

(declare-fun m!891397 () Bool)

(assert (=> b!962282 m!891397))

(declare-fun m!891399 () Bool)

(assert (=> start!82570 m!891399))

(declare-fun m!891401 () Bool)

(assert (=> start!82570 m!891401))

(declare-fun m!891403 () Bool)

(assert (=> start!82570 m!891403))

(declare-fun m!891405 () Bool)

(assert (=> b!962284 m!891405))

(assert (=> b!962284 m!891395))

(assert (=> b!962284 m!891405))

(assert (=> b!962284 m!891395))

(declare-fun m!891407 () Bool)

(assert (=> b!962284 m!891407))

(declare-fun m!891409 () Bool)

(assert (=> b!962280 m!891409))

(check-sat (not b_next!18721) tp_is_empty!21523 (not mapNonEmpty!34279) (not b!962287) (not b!962284) (not b!962280) (not start!82570) (not b!962282) b_and!30183)
(check-sat b_and!30183 (not b_next!18721))
