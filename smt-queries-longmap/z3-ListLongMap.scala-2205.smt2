; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36618 () Bool)

(assert start!36618)

(declare-fun b!365569 () Bool)

(declare-fun e!223874 () Bool)

(declare-fun e!223875 () Bool)

(declare-fun mapRes!14253 () Bool)

(assert (=> b!365569 (= e!223874 (and e!223875 mapRes!14253))))

(declare-fun condMapEmpty!14253 () Bool)

(declare-datatypes ((V!12395 0))(
  ( (V!12396 (val!4278 Int)) )
))
(declare-datatypes ((ValueCell!3890 0))(
  ( (ValueCellFull!3890 (v!6475 V!12395)) (EmptyCell!3890) )
))
(declare-datatypes ((array!20878 0))(
  ( (array!20879 (arr!9911 (Array (_ BitVec 32) ValueCell!3890)) (size!10263 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20878)

(declare-fun mapDefault!14253 () ValueCell!3890)

(assert (=> b!365569 (= condMapEmpty!14253 (= (arr!9911 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3890)) mapDefault!14253)))))

(declare-fun b!365570 () Bool)

(declare-fun res!204423 () Bool)

(declare-fun e!223876 () Bool)

(assert (=> b!365570 (=> (not res!204423) (not e!223876))))

(declare-datatypes ((array!20880 0))(
  ( (array!20881 (arr!9912 (Array (_ BitVec 32) (_ BitVec 64))) (size!10264 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20880)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20880 (_ BitVec 32)) Bool)

(assert (=> b!365570 (= res!204423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365571 () Bool)

(declare-fun res!204425 () Bool)

(assert (=> b!365571 (=> (not res!204425) (not e!223876))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365571 (= res!204425 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10264 _keys!658))))))

(declare-fun mapNonEmpty!14253 () Bool)

(declare-fun tp!28329 () Bool)

(declare-fun e!223872 () Bool)

(assert (=> mapNonEmpty!14253 (= mapRes!14253 (and tp!28329 e!223872))))

(declare-fun mapRest!14253 () (Array (_ BitVec 32) ValueCell!3890))

(declare-fun mapValue!14253 () ValueCell!3890)

(declare-fun mapKey!14253 () (_ BitVec 32))

(assert (=> mapNonEmpty!14253 (= (arr!9911 _values!506) (store mapRest!14253 mapKey!14253 mapValue!14253))))

(declare-fun b!365572 () Bool)

(assert (=> b!365572 (= e!223876 (and (or (= (select (arr!9912 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9912 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!10264 _keys!658))))))

(declare-fun b!365573 () Bool)

(declare-fun tp_is_empty!8467 () Bool)

(assert (=> b!365573 (= e!223875 tp_is_empty!8467)))

(declare-fun res!204424 () Bool)

(assert (=> start!36618 (=> (not res!204424) (not e!223876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36618 (= res!204424 (validMask!0 mask!970))))

(assert (=> start!36618 e!223876))

(assert (=> start!36618 true))

(declare-fun array_inv!7374 (array!20878) Bool)

(assert (=> start!36618 (and (array_inv!7374 _values!506) e!223874)))

(declare-fun array_inv!7375 (array!20880) Bool)

(assert (=> start!36618 (array_inv!7375 _keys!658)))

(declare-fun b!365574 () Bool)

(declare-fun res!204422 () Bool)

(assert (=> b!365574 (=> (not res!204422) (not e!223876))))

(declare-datatypes ((List!5440 0))(
  ( (Nil!5437) (Cons!5436 (h!6292 (_ BitVec 64)) (t!10582 List!5440)) )
))
(declare-fun arrayNoDuplicates!0 (array!20880 (_ BitVec 32) List!5440) Bool)

(assert (=> b!365574 (= res!204422 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5437))))

(declare-fun b!365575 () Bool)

(declare-fun res!204421 () Bool)

(assert (=> b!365575 (=> (not res!204421) (not e!223876))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365575 (= res!204421 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!14253 () Bool)

(assert (=> mapIsEmpty!14253 mapRes!14253))

(declare-fun b!365576 () Bool)

(declare-fun res!204426 () Bool)

(assert (=> b!365576 (=> (not res!204426) (not e!223876))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365576 (= res!204426 (and (= (size!10263 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10264 _keys!658) (size!10263 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365577 () Bool)

(assert (=> b!365577 (= e!223872 tp_is_empty!8467)))

(assert (= (and start!36618 res!204424) b!365576))

(assert (= (and b!365576 res!204426) b!365570))

(assert (= (and b!365570 res!204423) b!365574))

(assert (= (and b!365574 res!204422) b!365571))

(assert (= (and b!365571 res!204425) b!365575))

(assert (= (and b!365575 res!204421) b!365572))

(assert (= (and b!365569 condMapEmpty!14253) mapIsEmpty!14253))

(assert (= (and b!365569 (not condMapEmpty!14253)) mapNonEmpty!14253))

(get-info :version)

(assert (= (and mapNonEmpty!14253 ((_ is ValueCellFull!3890) mapValue!14253)) b!365577))

(assert (= (and b!365569 ((_ is ValueCellFull!3890) mapDefault!14253)) b!365573))

(assert (= start!36618 b!365569))

(declare-fun m!363497 () Bool)

(assert (=> mapNonEmpty!14253 m!363497))

(declare-fun m!363499 () Bool)

(assert (=> b!365572 m!363499))

(declare-fun m!363501 () Bool)

(assert (=> b!365575 m!363501))

(declare-fun m!363503 () Bool)

(assert (=> b!365570 m!363503))

(declare-fun m!363505 () Bool)

(assert (=> start!36618 m!363505))

(declare-fun m!363507 () Bool)

(assert (=> start!36618 m!363507))

(declare-fun m!363509 () Bool)

(assert (=> start!36618 m!363509))

(declare-fun m!363511 () Bool)

(assert (=> b!365574 m!363511))

(check-sat (not start!36618) (not mapNonEmpty!14253) (not b!365574) (not b!365575) tp_is_empty!8467 (not b!365570))
(check-sat)
