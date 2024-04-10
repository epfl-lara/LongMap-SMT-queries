; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37642 () Bool)

(assert start!37642)

(declare-fun b!385405 () Bool)

(declare-fun e!233904 () Bool)

(assert (=> b!385405 (= e!233904 false)))

(declare-fun lt!181608 () Bool)

(declare-datatypes ((array!22735 0))(
  ( (array!22736 (arr!10836 (Array (_ BitVec 32) (_ BitVec 64))) (size!11188 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22735)

(declare-datatypes ((List!6240 0))(
  ( (Nil!6237) (Cons!6236 (h!7092 (_ BitVec 64)) (t!11390 List!6240)) )
))
(declare-fun arrayNoDuplicates!0 (array!22735 (_ BitVec 32) List!6240) Bool)

(assert (=> b!385405 (= lt!181608 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6237))))

(declare-fun b!385406 () Bool)

(declare-fun res!219851 () Bool)

(assert (=> b!385406 (=> (not res!219851) (not e!233904))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22735 (_ BitVec 32)) Bool)

(assert (=> b!385406 (= res!219851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385407 () Bool)

(declare-fun e!233902 () Bool)

(declare-fun tp_is_empty!9417 () Bool)

(assert (=> b!385407 (= e!233902 tp_is_empty!9417)))

(declare-fun b!385408 () Bool)

(declare-fun e!233903 () Bool)

(assert (=> b!385408 (= e!233903 tp_is_empty!9417)))

(declare-fun b!385409 () Bool)

(declare-fun e!233905 () Bool)

(declare-fun mapRes!15690 () Bool)

(assert (=> b!385409 (= e!233905 (and e!233903 mapRes!15690))))

(declare-fun condMapEmpty!15690 () Bool)

(declare-datatypes ((V!13661 0))(
  ( (V!13662 (val!4753 Int)) )
))
(declare-datatypes ((ValueCell!4365 0))(
  ( (ValueCellFull!4365 (v!6950 V!13661)) (EmptyCell!4365) )
))
(declare-datatypes ((array!22737 0))(
  ( (array!22738 (arr!10837 (Array (_ BitVec 32) ValueCell!4365)) (size!11189 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22737)

(declare-fun mapDefault!15690 () ValueCell!4365)

(assert (=> b!385409 (= condMapEmpty!15690 (= (arr!10837 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4365)) mapDefault!15690)))))

(declare-fun mapNonEmpty!15690 () Bool)

(declare-fun tp!31017 () Bool)

(assert (=> mapNonEmpty!15690 (= mapRes!15690 (and tp!31017 e!233902))))

(declare-fun mapKey!15690 () (_ BitVec 32))

(declare-fun mapRest!15690 () (Array (_ BitVec 32) ValueCell!4365))

(declare-fun mapValue!15690 () ValueCell!4365)

(assert (=> mapNonEmpty!15690 (= (arr!10837 _values!506) (store mapRest!15690 mapKey!15690 mapValue!15690))))

(declare-fun mapIsEmpty!15690 () Bool)

(assert (=> mapIsEmpty!15690 mapRes!15690))

(declare-fun b!385404 () Bool)

(declare-fun res!219850 () Bool)

(assert (=> b!385404 (=> (not res!219850) (not e!233904))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385404 (= res!219850 (and (= (size!11189 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11188 _keys!658) (size!11189 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!219849 () Bool)

(assert (=> start!37642 (=> (not res!219849) (not e!233904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37642 (= res!219849 (validMask!0 mask!970))))

(assert (=> start!37642 e!233904))

(assert (=> start!37642 true))

(declare-fun array_inv!7976 (array!22737) Bool)

(assert (=> start!37642 (and (array_inv!7976 _values!506) e!233905)))

(declare-fun array_inv!7977 (array!22735) Bool)

(assert (=> start!37642 (array_inv!7977 _keys!658)))

(assert (= (and start!37642 res!219849) b!385404))

(assert (= (and b!385404 res!219850) b!385406))

(assert (= (and b!385406 res!219851) b!385405))

(assert (= (and b!385409 condMapEmpty!15690) mapIsEmpty!15690))

(assert (= (and b!385409 (not condMapEmpty!15690)) mapNonEmpty!15690))

(get-info :version)

(assert (= (and mapNonEmpty!15690 ((_ is ValueCellFull!4365) mapValue!15690)) b!385407))

(assert (= (and b!385409 ((_ is ValueCellFull!4365) mapDefault!15690)) b!385408))

(assert (= start!37642 b!385409))

(declare-fun m!382047 () Bool)

(assert (=> b!385405 m!382047))

(declare-fun m!382049 () Bool)

(assert (=> b!385406 m!382049))

(declare-fun m!382051 () Bool)

(assert (=> mapNonEmpty!15690 m!382051))

(declare-fun m!382053 () Bool)

(assert (=> start!37642 m!382053))

(declare-fun m!382055 () Bool)

(assert (=> start!37642 m!382055))

(declare-fun m!382057 () Bool)

(assert (=> start!37642 m!382057))

(check-sat (not mapNonEmpty!15690) (not b!385406) (not start!37642) tp_is_empty!9417 (not b!385405))
(check-sat)
