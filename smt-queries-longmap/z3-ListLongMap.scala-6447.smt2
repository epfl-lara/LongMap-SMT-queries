; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82690 () Bool)

(assert start!82690)

(declare-fun b!962579 () Bool)

(declare-fun e!542882 () Bool)

(declare-fun e!542879 () Bool)

(declare-fun mapRes!34180 () Bool)

(assert (=> b!962579 (= e!542882 (and e!542879 mapRes!34180))))

(declare-fun condMapEmpty!34180 () Bool)

(declare-datatypes ((V!33593 0))(
  ( (V!33594 (val!10779 Int)) )
))
(declare-datatypes ((ValueCell!10247 0))(
  ( (ValueCellFull!10247 (v!13334 V!33593)) (EmptyCell!10247) )
))
(declare-datatypes ((array!59032 0))(
  ( (array!59033 (arr!28380 (Array (_ BitVec 32) ValueCell!10247)) (size!28860 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59032)

(declare-fun mapDefault!34180 () ValueCell!10247)

(assert (=> b!962579 (= condMapEmpty!34180 (= (arr!28380 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10247)) mapDefault!34180)))))

(declare-fun b!962580 () Bool)

(declare-fun res!643936 () Bool)

(declare-fun e!542878 () Bool)

(assert (=> b!962580 (=> (not res!643936) (not e!542878))))

(declare-datatypes ((array!59034 0))(
  ( (array!59035 (arr!28381 (Array (_ BitVec 32) (_ BitVec 64))) (size!28861 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59034)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59034 (_ BitVec 32)) Bool)

(assert (=> b!962580 (= res!643936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962581 () Bool)

(assert (=> b!962581 (= e!542878 false)))

(declare-fun lt!431156 () Bool)

(declare-datatypes ((List!19677 0))(
  ( (Nil!19674) (Cons!19673 (h!20841 (_ BitVec 64)) (t!28032 List!19677)) )
))
(declare-fun arrayNoDuplicates!0 (array!59034 (_ BitVec 32) List!19677) Bool)

(assert (=> b!962581 (= lt!431156 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19674))))

(declare-fun b!962582 () Bool)

(declare-fun e!542881 () Bool)

(declare-fun tp_is_empty!21457 () Bool)

(assert (=> b!962582 (= e!542881 tp_is_empty!21457)))

(declare-fun mapNonEmpty!34180 () Bool)

(declare-fun tp!65110 () Bool)

(assert (=> mapNonEmpty!34180 (= mapRes!34180 (and tp!65110 e!542881))))

(declare-fun mapKey!34180 () (_ BitVec 32))

(declare-fun mapValue!34180 () ValueCell!10247)

(declare-fun mapRest!34180 () (Array (_ BitVec 32) ValueCell!10247))

(assert (=> mapNonEmpty!34180 (= (arr!28380 _values!1400) (store mapRest!34180 mapKey!34180 mapValue!34180))))

(declare-fun res!643937 () Bool)

(assert (=> start!82690 (=> (not res!643937) (not e!542878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82690 (= res!643937 (validMask!0 mask!2110))))

(assert (=> start!82690 e!542878))

(assert (=> start!82690 true))

(declare-fun array_inv!22067 (array!59032) Bool)

(assert (=> start!82690 (and (array_inv!22067 _values!1400) e!542882)))

(declare-fun array_inv!22068 (array!59034) Bool)

(assert (=> start!82690 (array_inv!22068 _keys!1686)))

(declare-fun b!962583 () Bool)

(assert (=> b!962583 (= e!542879 tp_is_empty!21457)))

(declare-fun b!962584 () Bool)

(declare-fun res!643938 () Bool)

(assert (=> b!962584 (=> (not res!643938) (not e!542878))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962584 (= res!643938 (and (= (size!28860 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28861 _keys!1686) (size!28860 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34180 () Bool)

(assert (=> mapIsEmpty!34180 mapRes!34180))

(assert (= (and start!82690 res!643937) b!962584))

(assert (= (and b!962584 res!643938) b!962580))

(assert (= (and b!962580 res!643936) b!962581))

(assert (= (and b!962579 condMapEmpty!34180) mapIsEmpty!34180))

(assert (= (and b!962579 (not condMapEmpty!34180)) mapNonEmpty!34180))

(get-info :version)

(assert (= (and mapNonEmpty!34180 ((_ is ValueCellFull!10247) mapValue!34180)) b!962582))

(assert (= (and b!962579 ((_ is ValueCellFull!10247) mapDefault!34180)) b!962583))

(assert (= start!82690 b!962579))

(declare-fun m!892843 () Bool)

(assert (=> b!962580 m!892843))

(declare-fun m!892845 () Bool)

(assert (=> b!962581 m!892845))

(declare-fun m!892847 () Bool)

(assert (=> mapNonEmpty!34180 m!892847))

(declare-fun m!892849 () Bool)

(assert (=> start!82690 m!892849))

(declare-fun m!892851 () Bool)

(assert (=> start!82690 m!892851))

(declare-fun m!892853 () Bool)

(assert (=> start!82690 m!892853))

(check-sat (not start!82690) (not b!962580) tp_is_empty!21457 (not mapNonEmpty!34180) (not b!962581))
(check-sat)
