; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36548 () Bool)

(assert start!36548)

(declare-fun b!365134 () Bool)

(declare-fun e!223513 () Bool)

(declare-fun tp_is_empty!8427 () Bool)

(assert (=> b!365134 (= e!223513 tp_is_empty!8427)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12341 0))(
  ( (V!12342 (val!4258 Int)) )
))
(declare-datatypes ((ValueCell!3870 0))(
  ( (ValueCellFull!3870 (v!6453 V!12341)) (EmptyCell!3870) )
))
(declare-datatypes ((array!20809 0))(
  ( (array!20810 (arr!9882 (Array (_ BitVec 32) ValueCell!3870)) (size!10234 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20809)

(declare-fun e!223511 () Bool)

(declare-fun b!365135 () Bool)

(declare-datatypes ((array!20811 0))(
  ( (array!20812 (arr!9883 (Array (_ BitVec 32) (_ BitVec 64))) (size!10235 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20811)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365135 (= e!223511 (and (= (size!10234 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10235 _keys!658) (size!10234 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (not (= (size!10235 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)))))))

(declare-fun b!365136 () Bool)

(declare-fun e!223512 () Bool)

(assert (=> b!365136 (= e!223512 tp_is_empty!8427)))

(declare-fun res!204184 () Bool)

(assert (=> start!36548 (=> (not res!204184) (not e!223511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36548 (= res!204184 (validMask!0 mask!970))))

(assert (=> start!36548 e!223511))

(assert (=> start!36548 true))

(declare-fun e!223510 () Bool)

(declare-fun array_inv!7324 (array!20809) Bool)

(assert (=> start!36548 (and (array_inv!7324 _values!506) e!223510)))

(declare-fun array_inv!7325 (array!20811) Bool)

(assert (=> start!36548 (array_inv!7325 _keys!658)))

(declare-fun mapNonEmpty!14178 () Bool)

(declare-fun mapRes!14178 () Bool)

(declare-fun tp!28254 () Bool)

(assert (=> mapNonEmpty!14178 (= mapRes!14178 (and tp!28254 e!223513))))

(declare-fun mapValue!14178 () ValueCell!3870)

(declare-fun mapKey!14178 () (_ BitVec 32))

(declare-fun mapRest!14178 () (Array (_ BitVec 32) ValueCell!3870))

(assert (=> mapNonEmpty!14178 (= (arr!9882 _values!506) (store mapRest!14178 mapKey!14178 mapValue!14178))))

(declare-fun b!365137 () Bool)

(assert (=> b!365137 (= e!223510 (and e!223512 mapRes!14178))))

(declare-fun condMapEmpty!14178 () Bool)

(declare-fun mapDefault!14178 () ValueCell!3870)

(assert (=> b!365137 (= condMapEmpty!14178 (= (arr!9882 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3870)) mapDefault!14178)))))

(declare-fun mapIsEmpty!14178 () Bool)

(assert (=> mapIsEmpty!14178 mapRes!14178))

(assert (= (and start!36548 res!204184) b!365135))

(assert (= (and b!365137 condMapEmpty!14178) mapIsEmpty!14178))

(assert (= (and b!365137 (not condMapEmpty!14178)) mapNonEmpty!14178))

(get-info :version)

(assert (= (and mapNonEmpty!14178 ((_ is ValueCellFull!3870) mapValue!14178)) b!365134))

(assert (= (and b!365137 ((_ is ValueCellFull!3870) mapDefault!14178)) b!365136))

(assert (= start!36548 b!365137))

(declare-fun m!362971 () Bool)

(assert (=> start!36548 m!362971))

(declare-fun m!362973 () Bool)

(assert (=> start!36548 m!362973))

(declare-fun m!362975 () Bool)

(assert (=> start!36548 m!362975))

(declare-fun m!362977 () Bool)

(assert (=> mapNonEmpty!14178 m!362977))

(check-sat (not start!36548) (not mapNonEmpty!14178) tp_is_empty!8427)
(check-sat)
