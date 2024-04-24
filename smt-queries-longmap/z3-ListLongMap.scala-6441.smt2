; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82654 () Bool)

(assert start!82654)

(declare-fun b!962255 () Bool)

(declare-fun e!542612 () Bool)

(assert (=> b!962255 (= e!542612 false)))

(declare-fun lt!431102 () Bool)

(declare-datatypes ((array!58968 0))(
  ( (array!58969 (arr!28348 (Array (_ BitVec 32) (_ BitVec 64))) (size!28828 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58968)

(declare-datatypes ((List!19669 0))(
  ( (Nil!19666) (Cons!19665 (h!20833 (_ BitVec 64)) (t!28024 List!19669)) )
))
(declare-fun arrayNoDuplicates!0 (array!58968 (_ BitVec 32) List!19669) Bool)

(assert (=> b!962255 (= lt!431102 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19666))))

(declare-fun b!962256 () Bool)

(declare-fun res!643776 () Bool)

(assert (=> b!962256 (=> (not res!643776) (not e!542612))))

(declare-datatypes ((V!33545 0))(
  ( (V!33546 (val!10761 Int)) )
))
(declare-datatypes ((ValueCell!10229 0))(
  ( (ValueCellFull!10229 (v!13316 V!33545)) (EmptyCell!10229) )
))
(declare-datatypes ((array!58970 0))(
  ( (array!58971 (arr!28349 (Array (_ BitVec 32) ValueCell!10229)) (size!28829 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58970)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962256 (= res!643776 (and (= (size!28829 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28828 _keys!1686) (size!28829 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962257 () Bool)

(declare-fun e!542611 () Bool)

(declare-fun tp_is_empty!21421 () Bool)

(assert (=> b!962257 (= e!542611 tp_is_empty!21421)))

(declare-fun mapIsEmpty!34126 () Bool)

(declare-fun mapRes!34126 () Bool)

(assert (=> mapIsEmpty!34126 mapRes!34126))

(declare-fun b!962259 () Bool)

(declare-fun res!643774 () Bool)

(assert (=> b!962259 (=> (not res!643774) (not e!542612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58968 (_ BitVec 32)) Bool)

(assert (=> b!962259 (= res!643774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34126 () Bool)

(declare-fun tp!65056 () Bool)

(declare-fun e!542608 () Bool)

(assert (=> mapNonEmpty!34126 (= mapRes!34126 (and tp!65056 e!542608))))

(declare-fun mapValue!34126 () ValueCell!10229)

(declare-fun mapKey!34126 () (_ BitVec 32))

(declare-fun mapRest!34126 () (Array (_ BitVec 32) ValueCell!10229))

(assert (=> mapNonEmpty!34126 (= (arr!28349 _values!1400) (store mapRest!34126 mapKey!34126 mapValue!34126))))

(declare-fun b!962260 () Bool)

(assert (=> b!962260 (= e!542608 tp_is_empty!21421)))

(declare-fun b!962258 () Bool)

(declare-fun e!542610 () Bool)

(assert (=> b!962258 (= e!542610 (and e!542611 mapRes!34126))))

(declare-fun condMapEmpty!34126 () Bool)

(declare-fun mapDefault!34126 () ValueCell!10229)

(assert (=> b!962258 (= condMapEmpty!34126 (= (arr!28349 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10229)) mapDefault!34126)))))

(declare-fun res!643775 () Bool)

(assert (=> start!82654 (=> (not res!643775) (not e!542612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82654 (= res!643775 (validMask!0 mask!2110))))

(assert (=> start!82654 e!542612))

(assert (=> start!82654 true))

(declare-fun array_inv!22045 (array!58970) Bool)

(assert (=> start!82654 (and (array_inv!22045 _values!1400) e!542610)))

(declare-fun array_inv!22046 (array!58968) Bool)

(assert (=> start!82654 (array_inv!22046 _keys!1686)))

(assert (= (and start!82654 res!643775) b!962256))

(assert (= (and b!962256 res!643776) b!962259))

(assert (= (and b!962259 res!643774) b!962255))

(assert (= (and b!962258 condMapEmpty!34126) mapIsEmpty!34126))

(assert (= (and b!962258 (not condMapEmpty!34126)) mapNonEmpty!34126))

(get-info :version)

(assert (= (and mapNonEmpty!34126 ((_ is ValueCellFull!10229) mapValue!34126)) b!962260))

(assert (= (and b!962258 ((_ is ValueCellFull!10229) mapDefault!34126)) b!962257))

(assert (= start!82654 b!962258))

(declare-fun m!892627 () Bool)

(assert (=> b!962255 m!892627))

(declare-fun m!892629 () Bool)

(assert (=> b!962259 m!892629))

(declare-fun m!892631 () Bool)

(assert (=> mapNonEmpty!34126 m!892631))

(declare-fun m!892633 () Bool)

(assert (=> start!82654 m!892633))

(declare-fun m!892635 () Bool)

(assert (=> start!82654 m!892635))

(declare-fun m!892637 () Bool)

(assert (=> start!82654 m!892637))

(check-sat tp_is_empty!21421 (not start!82654) (not mapNonEmpty!34126) (not b!962255) (not b!962259))
(check-sat)
