; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36654 () Bool)

(assert start!36654)

(declare-fun b!365691 () Bool)

(declare-fun res!204513 () Bool)

(declare-fun e!223937 () Bool)

(assert (=> b!365691 (=> (not res!204513) (not e!223937))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12427 0))(
  ( (V!12428 (val!4290 Int)) )
))
(declare-datatypes ((ValueCell!3902 0))(
  ( (ValueCellFull!3902 (v!6480 V!12427)) (EmptyCell!3902) )
))
(declare-datatypes ((array!20923 0))(
  ( (array!20924 (arr!9933 (Array (_ BitVec 32) ValueCell!3902)) (size!10286 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20923)

(declare-datatypes ((array!20925 0))(
  ( (array!20926 (arr!9934 (Array (_ BitVec 32) (_ BitVec 64))) (size!10287 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20925)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365691 (= res!204513 (and (= (size!10286 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10287 _keys!658) (size!10286 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!204512 () Bool)

(assert (=> start!36654 (=> (not res!204512) (not e!223937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36654 (= res!204512 (validMask!0 mask!970))))

(assert (=> start!36654 e!223937))

(assert (=> start!36654 true))

(declare-fun e!223941 () Bool)

(declare-fun array_inv!7366 (array!20923) Bool)

(assert (=> start!36654 (and (array_inv!7366 _values!506) e!223941)))

(declare-fun array_inv!7367 (array!20925) Bool)

(assert (=> start!36654 (array_inv!7367 _keys!658)))

(declare-fun mapIsEmpty!14292 () Bool)

(declare-fun mapRes!14292 () Bool)

(assert (=> mapIsEmpty!14292 mapRes!14292))

(declare-fun b!365692 () Bool)

(declare-fun e!223940 () Bool)

(declare-fun tp_is_empty!8491 () Bool)

(assert (=> b!365692 (= e!223940 tp_is_empty!8491)))

(declare-fun b!365693 () Bool)

(declare-fun e!223939 () Bool)

(assert (=> b!365693 (= e!223939 tp_is_empty!8491)))

(declare-fun b!365694 () Bool)

(assert (=> b!365694 (= e!223941 (and e!223939 mapRes!14292))))

(declare-fun condMapEmpty!14292 () Bool)

(declare-fun mapDefault!14292 () ValueCell!3902)

(assert (=> b!365694 (= condMapEmpty!14292 (= (arr!9933 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3902)) mapDefault!14292)))))

(declare-fun b!365695 () Bool)

(assert (=> b!365695 (= e!223937 false)))

(declare-fun lt!168983 () Bool)

(declare-datatypes ((List!5504 0))(
  ( (Nil!5501) (Cons!5500 (h!6356 (_ BitVec 64)) (t!10645 List!5504)) )
))
(declare-fun arrayNoDuplicates!0 (array!20925 (_ BitVec 32) List!5504) Bool)

(assert (=> b!365695 (= lt!168983 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5501))))

(declare-fun mapNonEmpty!14292 () Bool)

(declare-fun tp!28368 () Bool)

(assert (=> mapNonEmpty!14292 (= mapRes!14292 (and tp!28368 e!223940))))

(declare-fun mapKey!14292 () (_ BitVec 32))

(declare-fun mapRest!14292 () (Array (_ BitVec 32) ValueCell!3902))

(declare-fun mapValue!14292 () ValueCell!3902)

(assert (=> mapNonEmpty!14292 (= (arr!9933 _values!506) (store mapRest!14292 mapKey!14292 mapValue!14292))))

(declare-fun b!365696 () Bool)

(declare-fun res!204511 () Bool)

(assert (=> b!365696 (=> (not res!204511) (not e!223937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20925 (_ BitVec 32)) Bool)

(assert (=> b!365696 (= res!204511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36654 res!204512) b!365691))

(assert (= (and b!365691 res!204513) b!365696))

(assert (= (and b!365696 res!204511) b!365695))

(assert (= (and b!365694 condMapEmpty!14292) mapIsEmpty!14292))

(assert (= (and b!365694 (not condMapEmpty!14292)) mapNonEmpty!14292))

(get-info :version)

(assert (= (and mapNonEmpty!14292 ((_ is ValueCellFull!3902) mapValue!14292)) b!365692))

(assert (= (and b!365694 ((_ is ValueCellFull!3902) mapDefault!14292)) b!365693))

(assert (= start!36654 b!365694))

(declare-fun m!362747 () Bool)

(assert (=> start!36654 m!362747))

(declare-fun m!362749 () Bool)

(assert (=> start!36654 m!362749))

(declare-fun m!362751 () Bool)

(assert (=> start!36654 m!362751))

(declare-fun m!362753 () Bool)

(assert (=> b!365695 m!362753))

(declare-fun m!362755 () Bool)

(assert (=> mapNonEmpty!14292 m!362755))

(declare-fun m!362757 () Bool)

(assert (=> b!365696 m!362757))

(check-sat (not start!36654) (not mapNonEmpty!14292) tp_is_empty!8491 (not b!365695) (not b!365696))
(check-sat)
