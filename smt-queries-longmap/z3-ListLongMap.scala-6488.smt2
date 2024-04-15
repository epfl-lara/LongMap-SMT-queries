; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82750 () Bool)

(assert start!82750)

(declare-fun b_free!18901 () Bool)

(declare-fun b_next!18901 () Bool)

(assert (=> start!82750 (= b_free!18901 (not b_next!18901))))

(declare-fun tp!65824 () Bool)

(declare-fun b_and!30363 () Bool)

(assert (=> start!82750 (= tp!65824 b_and!30363)))

(declare-fun b!965169 () Bool)

(declare-fun res!646110 () Bool)

(declare-fun e!544076 () Bool)

(assert (=> b!965169 (=> (not res!646110) (not e!544076))))

(declare-datatypes ((array!59426 0))(
  ( (array!59427 (arr!28582 (Array (_ BitVec 32) (_ BitVec 64))) (size!29063 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59426)

(declare-datatypes ((List!19894 0))(
  ( (Nil!19891) (Cons!19890 (h!21052 (_ BitVec 64)) (t!28248 List!19894)) )
))
(declare-fun arrayNoDuplicates!0 (array!59426 (_ BitVec 32) List!19894) Bool)

(assert (=> b!965169 (= res!646110 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19891))))

(declare-fun b!965170 () Bool)

(declare-fun res!646112 () Bool)

(assert (=> b!965170 (=> (not res!646112) (not e!544076))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33921 0))(
  ( (V!33922 (val!10902 Int)) )
))
(declare-datatypes ((ValueCell!10370 0))(
  ( (ValueCellFull!10370 (v!13459 V!33921)) (EmptyCell!10370) )
))
(declare-datatypes ((array!59428 0))(
  ( (array!59429 (arr!28583 (Array (_ BitVec 32) ValueCell!10370)) (size!29064 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59428)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965170 (= res!646112 (and (= (size!29064 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29063 _keys!1686) (size!29064 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965171 () Bool)

(declare-fun res!646108 () Bool)

(assert (=> b!965171 (=> (not res!646108) (not e!544076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59426 (_ BitVec 32)) Bool)

(assert (=> b!965171 (= res!646108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965172 () Bool)

(declare-fun res!646111 () Bool)

(assert (=> b!965172 (=> (not res!646111) (not e!544076))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965172 (= res!646111 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29063 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29063 _keys!1686))))))

(declare-fun mapNonEmpty!34549 () Bool)

(declare-fun mapRes!34549 () Bool)

(declare-fun tp!65823 () Bool)

(declare-fun e!544078 () Bool)

(assert (=> mapNonEmpty!34549 (= mapRes!34549 (and tp!65823 e!544078))))

(declare-fun mapValue!34549 () ValueCell!10370)

(declare-fun mapKey!34549 () (_ BitVec 32))

(declare-fun mapRest!34549 () (Array (_ BitVec 32) ValueCell!10370))

(assert (=> mapNonEmpty!34549 (= (arr!28583 _values!1400) (store mapRest!34549 mapKey!34549 mapValue!34549))))

(declare-fun b!965173 () Bool)

(declare-fun e!544074 () Bool)

(declare-fun tp_is_empty!21703 () Bool)

(assert (=> b!965173 (= e!544074 tp_is_empty!21703)))

(declare-fun mapIsEmpty!34549 () Bool)

(assert (=> mapIsEmpty!34549 mapRes!34549))

(declare-fun b!965175 () Bool)

(declare-fun e!544075 () Bool)

(assert (=> b!965175 (= e!544075 (and e!544074 mapRes!34549))))

(declare-fun condMapEmpty!34549 () Bool)

(declare-fun mapDefault!34549 () ValueCell!10370)

(assert (=> b!965175 (= condMapEmpty!34549 (= (arr!28583 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10370)) mapDefault!34549)))))

(declare-fun b!965174 () Bool)

(assert (=> b!965174 (= e!544078 tp_is_empty!21703)))

(declare-fun res!646109 () Bool)

(assert (=> start!82750 (=> (not res!646109) (not e!544076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82750 (= res!646109 (validMask!0 mask!2110))))

(assert (=> start!82750 e!544076))

(assert (=> start!82750 true))

(declare-fun array_inv!22195 (array!59428) Bool)

(assert (=> start!82750 (and (array_inv!22195 _values!1400) e!544075)))

(declare-fun array_inv!22196 (array!59426) Bool)

(assert (=> start!82750 (array_inv!22196 _keys!1686)))

(assert (=> start!82750 tp!65824))

(assert (=> start!82750 tp_is_empty!21703))

(declare-fun b!965176 () Bool)

(assert (=> b!965176 (= e!544076 false)))

(declare-fun minValue!1342 () V!33921)

(declare-fun lt!431000 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33921)

(declare-datatypes ((tuple2!14086 0))(
  ( (tuple2!14087 (_1!7054 (_ BitVec 64)) (_2!7054 V!33921)) )
))
(declare-datatypes ((List!19895 0))(
  ( (Nil!19892) (Cons!19891 (h!21053 tuple2!14086) (t!28249 List!19895)) )
))
(declare-datatypes ((ListLongMap!12773 0))(
  ( (ListLongMap!12774 (toList!6402 List!19895)) )
))
(declare-fun contains!5449 (ListLongMap!12773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3564 (array!59426 array!59428 (_ BitVec 32) (_ BitVec 32) V!33921 V!33921 (_ BitVec 32) Int) ListLongMap!12773)

(assert (=> b!965176 (= lt!431000 (contains!5449 (getCurrentListMap!3564 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28582 _keys!1686) i!803)))))

(declare-fun b!965177 () Bool)

(declare-fun res!646107 () Bool)

(assert (=> b!965177 (=> (not res!646107) (not e!544076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965177 (= res!646107 (validKeyInArray!0 (select (arr!28582 _keys!1686) i!803)))))

(assert (= (and start!82750 res!646109) b!965170))

(assert (= (and b!965170 res!646112) b!965171))

(assert (= (and b!965171 res!646108) b!965169))

(assert (= (and b!965169 res!646110) b!965172))

(assert (= (and b!965172 res!646111) b!965177))

(assert (= (and b!965177 res!646107) b!965176))

(assert (= (and b!965175 condMapEmpty!34549) mapIsEmpty!34549))

(assert (= (and b!965175 (not condMapEmpty!34549)) mapNonEmpty!34549))

(get-info :version)

(assert (= (and mapNonEmpty!34549 ((_ is ValueCellFull!10370) mapValue!34549)) b!965174))

(assert (= (and b!965175 ((_ is ValueCellFull!10370) mapDefault!34549)) b!965173))

(assert (= start!82750 b!965175))

(declare-fun m!893731 () Bool)

(assert (=> start!82750 m!893731))

(declare-fun m!893733 () Bool)

(assert (=> start!82750 m!893733))

(declare-fun m!893735 () Bool)

(assert (=> start!82750 m!893735))

(declare-fun m!893737 () Bool)

(assert (=> b!965176 m!893737))

(declare-fun m!893739 () Bool)

(assert (=> b!965176 m!893739))

(assert (=> b!965176 m!893737))

(assert (=> b!965176 m!893739))

(declare-fun m!893741 () Bool)

(assert (=> b!965176 m!893741))

(declare-fun m!893743 () Bool)

(assert (=> mapNonEmpty!34549 m!893743))

(declare-fun m!893745 () Bool)

(assert (=> b!965171 m!893745))

(declare-fun m!893747 () Bool)

(assert (=> b!965169 m!893747))

(assert (=> b!965177 m!893739))

(assert (=> b!965177 m!893739))

(declare-fun m!893749 () Bool)

(assert (=> b!965177 m!893749))

(check-sat (not b!965177) (not b!965169) (not mapNonEmpty!34549) tp_is_empty!21703 (not b_next!18901) (not start!82750) (not b!965176) (not b!965171) b_and!30363)
(check-sat b_and!30363 (not b_next!18901))
