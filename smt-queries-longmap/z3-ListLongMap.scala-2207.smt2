; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36642 () Bool)

(assert start!36642)

(declare-fun mapIsEmpty!14274 () Bool)

(declare-fun mapRes!14274 () Bool)

(assert (=> mapIsEmpty!14274 mapRes!14274))

(declare-fun mapNonEmpty!14274 () Bool)

(declare-fun tp!28350 () Bool)

(declare-fun e!223989 () Bool)

(assert (=> mapNonEmpty!14274 (= mapRes!14274 (and tp!28350 e!223989))))

(declare-datatypes ((V!12411 0))(
  ( (V!12412 (val!4284 Int)) )
))
(declare-datatypes ((ValueCell!3896 0))(
  ( (ValueCellFull!3896 (v!6481 V!12411)) (EmptyCell!3896) )
))
(declare-fun mapValue!14274 () ValueCell!3896)

(declare-datatypes ((array!20904 0))(
  ( (array!20905 (arr!9923 (Array (_ BitVec 32) ValueCell!3896)) (size!10275 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20904)

(declare-fun mapRest!14274 () (Array (_ BitVec 32) ValueCell!3896))

(declare-fun mapKey!14274 () (_ BitVec 32))

(assert (=> mapNonEmpty!14274 (= (arr!9923 _values!506) (store mapRest!14274 mapKey!14274 mapValue!14274))))

(declare-fun b!365760 () Bool)

(declare-fun res!204538 () Bool)

(declare-fun e!223991 () Bool)

(assert (=> b!365760 (=> (not res!204538) (not e!223991))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!20906 0))(
  ( (array!20907 (arr!9924 (Array (_ BitVec 32) (_ BitVec 64))) (size!10276 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20906)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365760 (= res!204538 (and (= (size!10275 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10276 _keys!658) (size!10275 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!204539 () Bool)

(assert (=> start!36642 (=> (not res!204539) (not e!223991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36642 (= res!204539 (validMask!0 mask!970))))

(assert (=> start!36642 e!223991))

(assert (=> start!36642 true))

(declare-fun e!223990 () Bool)

(declare-fun array_inv!7384 (array!20904) Bool)

(assert (=> start!36642 (and (array_inv!7384 _values!506) e!223990)))

(declare-fun array_inv!7385 (array!20906) Bool)

(assert (=> start!36642 (array_inv!7385 _keys!658)))

(declare-fun b!365761 () Bool)

(declare-fun e!223993 () Bool)

(declare-fun tp_is_empty!8479 () Bool)

(assert (=> b!365761 (= e!223993 tp_is_empty!8479)))

(declare-fun b!365762 () Bool)

(assert (=> b!365762 (= e!223990 (and e!223993 mapRes!14274))))

(declare-fun condMapEmpty!14274 () Bool)

(declare-fun mapDefault!14274 () ValueCell!3896)

(assert (=> b!365762 (= condMapEmpty!14274 (= (arr!9923 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3896)) mapDefault!14274)))))

(declare-fun b!365763 () Bool)

(assert (=> b!365763 (= e!223991 false)))

(declare-fun lt!169227 () Bool)

(declare-datatypes ((List!5445 0))(
  ( (Nil!5442) (Cons!5441 (h!6297 (_ BitVec 64)) (t!10587 List!5445)) )
))
(declare-fun arrayNoDuplicates!0 (array!20906 (_ BitVec 32) List!5445) Bool)

(assert (=> b!365763 (= lt!169227 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5442))))

(declare-fun b!365764 () Bool)

(assert (=> b!365764 (= e!223989 tp_is_empty!8479)))

(declare-fun b!365765 () Bool)

(declare-fun res!204540 () Bool)

(assert (=> b!365765 (=> (not res!204540) (not e!223991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20906 (_ BitVec 32)) Bool)

(assert (=> b!365765 (= res!204540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36642 res!204539) b!365760))

(assert (= (and b!365760 res!204538) b!365765))

(assert (= (and b!365765 res!204540) b!365763))

(assert (= (and b!365762 condMapEmpty!14274) mapIsEmpty!14274))

(assert (= (and b!365762 (not condMapEmpty!14274)) mapNonEmpty!14274))

(get-info :version)

(assert (= (and mapNonEmpty!14274 ((_ is ValueCellFull!3896) mapValue!14274)) b!365764))

(assert (= (and b!365762 ((_ is ValueCellFull!3896) mapDefault!14274)) b!365761))

(assert (= start!36642 b!365762))

(declare-fun m!363611 () Bool)

(assert (=> mapNonEmpty!14274 m!363611))

(declare-fun m!363613 () Bool)

(assert (=> start!36642 m!363613))

(declare-fun m!363615 () Bool)

(assert (=> start!36642 m!363615))

(declare-fun m!363617 () Bool)

(assert (=> start!36642 m!363617))

(declare-fun m!363619 () Bool)

(assert (=> b!365763 m!363619))

(declare-fun m!363621 () Bool)

(assert (=> b!365765 m!363621))

(check-sat (not b!365763) (not mapNonEmpty!14274) (not start!36642) tp_is_empty!8479 (not b!365765))
(check-sat)
