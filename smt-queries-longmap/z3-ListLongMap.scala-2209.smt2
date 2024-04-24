; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36654 () Bool)

(assert start!36654)

(declare-fun mapIsEmpty!14292 () Bool)

(declare-fun mapRes!14292 () Bool)

(assert (=> mapIsEmpty!14292 mapRes!14292))

(declare-fun b!365913 () Bool)

(declare-fun e!224081 () Bool)

(declare-fun tp_is_empty!8491 () Bool)

(assert (=> b!365913 (= e!224081 tp_is_empty!8491)))

(declare-fun b!365914 () Bool)

(declare-fun e!224083 () Bool)

(assert (=> b!365914 (= e!224083 false)))

(declare-fun lt!169236 () Bool)

(declare-datatypes ((array!20928 0))(
  ( (array!20929 (arr!9935 (Array (_ BitVec 32) (_ BitVec 64))) (size!10287 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20928)

(declare-datatypes ((List!5449 0))(
  ( (Nil!5446) (Cons!5445 (h!6301 (_ BitVec 64)) (t!10591 List!5449)) )
))
(declare-fun arrayNoDuplicates!0 (array!20928 (_ BitVec 32) List!5449) Bool)

(assert (=> b!365914 (= lt!169236 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5446))))

(declare-fun b!365915 () Bool)

(declare-fun e!224080 () Bool)

(assert (=> b!365915 (= e!224080 (and e!224081 mapRes!14292))))

(declare-fun condMapEmpty!14292 () Bool)

(declare-datatypes ((V!12427 0))(
  ( (V!12428 (val!4290 Int)) )
))
(declare-datatypes ((ValueCell!3902 0))(
  ( (ValueCellFull!3902 (v!6487 V!12427)) (EmptyCell!3902) )
))
(declare-datatypes ((array!20930 0))(
  ( (array!20931 (arr!9936 (Array (_ BitVec 32) ValueCell!3902)) (size!10288 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20930)

(declare-fun mapDefault!14292 () ValueCell!3902)

(assert (=> b!365915 (= condMapEmpty!14292 (= (arr!9936 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3902)) mapDefault!14292)))))

(declare-fun res!204639 () Bool)

(assert (=> start!36654 (=> (not res!204639) (not e!224083))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36654 (= res!204639 (validMask!0 mask!970))))

(assert (=> start!36654 e!224083))

(assert (=> start!36654 true))

(declare-fun array_inv!7392 (array!20930) Bool)

(assert (=> start!36654 (and (array_inv!7392 _values!506) e!224080)))

(declare-fun array_inv!7393 (array!20928) Bool)

(assert (=> start!36654 (array_inv!7393 _keys!658)))

(declare-fun b!365916 () Bool)

(declare-fun res!204637 () Bool)

(assert (=> b!365916 (=> (not res!204637) (not e!224083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20928 (_ BitVec 32)) Bool)

(assert (=> b!365916 (= res!204637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14292 () Bool)

(declare-fun tp!28368 () Bool)

(declare-fun e!224082 () Bool)

(assert (=> mapNonEmpty!14292 (= mapRes!14292 (and tp!28368 e!224082))))

(declare-fun mapValue!14292 () ValueCell!3902)

(declare-fun mapKey!14292 () (_ BitVec 32))

(declare-fun mapRest!14292 () (Array (_ BitVec 32) ValueCell!3902))

(assert (=> mapNonEmpty!14292 (= (arr!9936 _values!506) (store mapRest!14292 mapKey!14292 mapValue!14292))))

(declare-fun b!365917 () Bool)

(declare-fun res!204638 () Bool)

(assert (=> b!365917 (=> (not res!204638) (not e!224083))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365917 (= res!204638 (and (= (size!10288 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10287 _keys!658) (size!10288 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365918 () Bool)

(assert (=> b!365918 (= e!224082 tp_is_empty!8491)))

(assert (= (and start!36654 res!204639) b!365917))

(assert (= (and b!365917 res!204638) b!365916))

(assert (= (and b!365916 res!204637) b!365914))

(assert (= (and b!365915 condMapEmpty!14292) mapIsEmpty!14292))

(assert (= (and b!365915 (not condMapEmpty!14292)) mapNonEmpty!14292))

(get-info :version)

(assert (= (and mapNonEmpty!14292 ((_ is ValueCellFull!3902) mapValue!14292)) b!365918))

(assert (= (and b!365915 ((_ is ValueCellFull!3902) mapDefault!14292)) b!365913))

(assert (= start!36654 b!365915))

(declare-fun m!363701 () Bool)

(assert (=> b!365914 m!363701))

(declare-fun m!363703 () Bool)

(assert (=> start!36654 m!363703))

(declare-fun m!363705 () Bool)

(assert (=> start!36654 m!363705))

(declare-fun m!363707 () Bool)

(assert (=> start!36654 m!363707))

(declare-fun m!363709 () Bool)

(assert (=> b!365916 m!363709))

(declare-fun m!363711 () Bool)

(assert (=> mapNonEmpty!14292 m!363711))

(check-sat (not start!36654) tp_is_empty!8491 (not b!365916) (not mapNonEmpty!14292) (not b!365914))
(check-sat)
