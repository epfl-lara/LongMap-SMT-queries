; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39516 () Bool)

(assert start!39516)

(declare-fun b_free!9783 () Bool)

(declare-fun b_next!9783 () Bool)

(assert (=> start!39516 (= b_free!9783 (not b_next!9783))))

(declare-fun tp!34878 () Bool)

(declare-fun b_and!17439 () Bool)

(assert (=> start!39516 (= tp!34878 b_and!17439)))

(declare-fun mapNonEmpty!18024 () Bool)

(declare-fun mapRes!18024 () Bool)

(declare-fun tp!34877 () Bool)

(declare-fun e!251309 () Bool)

(assert (=> mapNonEmpty!18024 (= mapRes!18024 (and tp!34877 e!251309))))

(declare-datatypes ((V!15685 0))(
  ( (V!15686 (val!5512 Int)) )
))
(declare-datatypes ((ValueCell!5124 0))(
  ( (ValueCellFull!5124 (v!7759 V!15685)) (EmptyCell!5124) )
))
(declare-datatypes ((array!25717 0))(
  ( (array!25718 (arr!12308 (Array (_ BitVec 32) ValueCell!5124)) (size!12660 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25717)

(declare-fun mapKey!18024 () (_ BitVec 32))

(declare-fun mapValue!18024 () ValueCell!5124)

(declare-fun mapRest!18024 () (Array (_ BitVec 32) ValueCell!5124))

(assert (=> mapNonEmpty!18024 (= (arr!12308 _values!549) (store mapRest!18024 mapKey!18024 mapValue!18024))))

(declare-fun b!422365 () Bool)

(declare-fun res!246622 () Bool)

(declare-fun e!251308 () Bool)

(assert (=> b!422365 (=> (not res!246622) (not e!251308))))

(declare-datatypes ((array!25719 0))(
  ( (array!25720 (arr!12309 (Array (_ BitVec 32) (_ BitVec 64))) (size!12661 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25719)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25719 (_ BitVec 32)) Bool)

(assert (=> b!422365 (= res!246622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422366 () Bool)

(declare-fun e!251310 () Bool)

(assert (=> b!422366 (= e!251308 e!251310)))

(declare-fun res!246620 () Bool)

(assert (=> b!422366 (=> (not res!246620) (not e!251310))))

(declare-fun lt!193954 () array!25719)

(assert (=> b!422366 (= res!246620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193954 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422366 (= lt!193954 (array!25720 (store (arr!12309 _keys!709) i!563 k0!794) (size!12661 _keys!709)))))

(declare-fun b!422367 () Bool)

(declare-fun res!246618 () Bool)

(assert (=> b!422367 (=> (not res!246618) (not e!251310))))

(declare-datatypes ((List!7243 0))(
  ( (Nil!7240) (Cons!7239 (h!8095 (_ BitVec 64)) (t!12687 List!7243)) )
))
(declare-fun arrayNoDuplicates!0 (array!25719 (_ BitVec 32) List!7243) Bool)

(assert (=> b!422367 (= res!246618 (arrayNoDuplicates!0 lt!193954 #b00000000000000000000000000000000 Nil!7240))))

(declare-fun b!422368 () Bool)

(declare-fun res!246624 () Bool)

(assert (=> b!422368 (=> (not res!246624) (not e!251308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422368 (= res!246624 (validMask!0 mask!1025))))

(declare-fun b!422369 () Bool)

(declare-fun res!246625 () Bool)

(assert (=> b!422369 (=> (not res!246625) (not e!251308))))

(declare-fun arrayContainsKey!0 (array!25719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422369 (= res!246625 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422370 () Bool)

(declare-fun res!246627 () Bool)

(assert (=> b!422370 (=> (not res!246627) (not e!251310))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422370 (= res!246627 (bvsle from!863 i!563))))

(declare-fun b!422371 () Bool)

(declare-fun res!246616 () Bool)

(assert (=> b!422371 (=> (not res!246616) (not e!251308))))

(assert (=> b!422371 (= res!246616 (or (= (select (arr!12309 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12309 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422372 () Bool)

(declare-fun res!246617 () Bool)

(assert (=> b!422372 (=> (not res!246617) (not e!251308))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!422372 (= res!246617 (and (= (size!12660 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12661 _keys!709) (size!12660 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422373 () Bool)

(declare-fun res!246619 () Bool)

(assert (=> b!422373 (=> (not res!246619) (not e!251308))))

(assert (=> b!422373 (= res!246619 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12661 _keys!709))))))

(declare-fun b!422374 () Bool)

(declare-fun tp_is_empty!10935 () Bool)

(assert (=> b!422374 (= e!251309 tp_is_empty!10935)))

(declare-fun mapIsEmpty!18024 () Bool)

(assert (=> mapIsEmpty!18024 mapRes!18024))

(declare-fun res!246621 () Bool)

(assert (=> start!39516 (=> (not res!246621) (not e!251308))))

(assert (=> start!39516 (= res!246621 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12661 _keys!709))))))

(assert (=> start!39516 e!251308))

(assert (=> start!39516 tp_is_empty!10935))

(assert (=> start!39516 tp!34878))

(assert (=> start!39516 true))

(declare-fun e!251305 () Bool)

(declare-fun array_inv!8968 (array!25717) Bool)

(assert (=> start!39516 (and (array_inv!8968 _values!549) e!251305)))

(declare-fun array_inv!8969 (array!25719) Bool)

(assert (=> start!39516 (array_inv!8969 _keys!709)))

(declare-fun b!422364 () Bool)

(declare-fun e!251307 () Bool)

(assert (=> b!422364 (= e!251307 tp_is_empty!10935)))

(declare-fun b!422375 () Bool)

(assert (=> b!422375 (= e!251305 (and e!251307 mapRes!18024))))

(declare-fun condMapEmpty!18024 () Bool)

(declare-fun mapDefault!18024 () ValueCell!5124)

(assert (=> b!422375 (= condMapEmpty!18024 (= (arr!12308 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5124)) mapDefault!18024)))))

(declare-fun b!422376 () Bool)

(declare-fun res!246626 () Bool)

(assert (=> b!422376 (=> (not res!246626) (not e!251308))))

(assert (=> b!422376 (= res!246626 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7240))))

(declare-fun b!422377 () Bool)

(declare-fun res!246623 () Bool)

(assert (=> b!422377 (=> (not res!246623) (not e!251308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422377 (= res!246623 (validKeyInArray!0 k0!794))))

(declare-fun b!422378 () Bool)

(assert (=> b!422378 (= e!251310 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15685)

(declare-fun v!412 () V!15685)

(declare-fun minValue!515 () V!15685)

(declare-datatypes ((tuple2!7238 0))(
  ( (tuple2!7239 (_1!3630 (_ BitVec 64)) (_2!3630 V!15685)) )
))
(declare-datatypes ((List!7244 0))(
  ( (Nil!7241) (Cons!7240 (h!8096 tuple2!7238) (t!12688 List!7244)) )
))
(declare-datatypes ((ListLongMap!6151 0))(
  ( (ListLongMap!6152 (toList!3091 List!7244)) )
))
(declare-fun lt!193955 () ListLongMap!6151)

(declare-fun getCurrentListMapNoExtraKeys!1295 (array!25719 array!25717 (_ BitVec 32) (_ BitVec 32) V!15685 V!15685 (_ BitVec 32) Int) ListLongMap!6151)

(assert (=> b!422378 (= lt!193955 (getCurrentListMapNoExtraKeys!1295 lt!193954 (array!25718 (store (arr!12308 _values!549) i!563 (ValueCellFull!5124 v!412)) (size!12660 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193953 () ListLongMap!6151)

(assert (=> b!422378 (= lt!193953 (getCurrentListMapNoExtraKeys!1295 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39516 res!246621) b!422368))

(assert (= (and b!422368 res!246624) b!422372))

(assert (= (and b!422372 res!246617) b!422365))

(assert (= (and b!422365 res!246622) b!422376))

(assert (= (and b!422376 res!246626) b!422373))

(assert (= (and b!422373 res!246619) b!422377))

(assert (= (and b!422377 res!246623) b!422371))

(assert (= (and b!422371 res!246616) b!422369))

(assert (= (and b!422369 res!246625) b!422366))

(assert (= (and b!422366 res!246620) b!422367))

(assert (= (and b!422367 res!246618) b!422370))

(assert (= (and b!422370 res!246627) b!422378))

(assert (= (and b!422375 condMapEmpty!18024) mapIsEmpty!18024))

(assert (= (and b!422375 (not condMapEmpty!18024)) mapNonEmpty!18024))

(get-info :version)

(assert (= (and mapNonEmpty!18024 ((_ is ValueCellFull!5124) mapValue!18024)) b!422374))

(assert (= (and b!422375 ((_ is ValueCellFull!5124) mapDefault!18024)) b!422364))

(assert (= start!39516 b!422375))

(declare-fun m!412203 () Bool)

(assert (=> b!422376 m!412203))

(declare-fun m!412205 () Bool)

(assert (=> b!422368 m!412205))

(declare-fun m!412207 () Bool)

(assert (=> b!422366 m!412207))

(declare-fun m!412209 () Bool)

(assert (=> b!422366 m!412209))

(declare-fun m!412211 () Bool)

(assert (=> b!422371 m!412211))

(declare-fun m!412213 () Bool)

(assert (=> mapNonEmpty!18024 m!412213))

(declare-fun m!412215 () Bool)

(assert (=> start!39516 m!412215))

(declare-fun m!412217 () Bool)

(assert (=> start!39516 m!412217))

(declare-fun m!412219 () Bool)

(assert (=> b!422377 m!412219))

(declare-fun m!412221 () Bool)

(assert (=> b!422367 m!412221))

(declare-fun m!412223 () Bool)

(assert (=> b!422378 m!412223))

(declare-fun m!412225 () Bool)

(assert (=> b!422378 m!412225))

(declare-fun m!412227 () Bool)

(assert (=> b!422378 m!412227))

(declare-fun m!412229 () Bool)

(assert (=> b!422365 m!412229))

(declare-fun m!412231 () Bool)

(assert (=> b!422369 m!412231))

(check-sat (not mapNonEmpty!18024) (not b!422369) (not b_next!9783) b_and!17439 (not b!422366) (not b!422368) (not b!422376) (not b!422378) (not b!422365) tp_is_empty!10935 (not b!422367) (not start!39516) (not b!422377))
(check-sat b_and!17439 (not b_next!9783))
