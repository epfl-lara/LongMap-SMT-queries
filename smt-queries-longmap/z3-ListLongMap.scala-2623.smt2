; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39542 () Bool)

(assert start!39542)

(declare-fun b_free!9823 () Bool)

(declare-fun b_next!9823 () Bool)

(assert (=> start!39542 (= b_free!9823 (not b_next!9823))))

(declare-fun tp!34997 () Bool)

(declare-fun b_and!17493 () Bool)

(assert (=> start!39542 (= tp!34997 b_and!17493)))

(declare-fun mapNonEmpty!18084 () Bool)

(declare-fun mapRes!18084 () Bool)

(declare-fun tp!34998 () Bool)

(declare-fun e!251637 () Bool)

(assert (=> mapNonEmpty!18084 (= mapRes!18084 (and tp!34998 e!251637))))

(declare-datatypes ((V!15739 0))(
  ( (V!15740 (val!5532 Int)) )
))
(declare-datatypes ((ValueCell!5144 0))(
  ( (ValueCellFull!5144 (v!7780 V!15739)) (EmptyCell!5144) )
))
(declare-fun mapRest!18084 () (Array (_ BitVec 32) ValueCell!5144))

(declare-fun mapKey!18084 () (_ BitVec 32))

(declare-fun mapValue!18084 () ValueCell!5144)

(declare-datatypes ((array!25804 0))(
  ( (array!25805 (arr!12351 (Array (_ BitVec 32) ValueCell!5144)) (size!12703 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25804)

(assert (=> mapNonEmpty!18084 (= (arr!12351 _values!549) (store mapRest!18084 mapKey!18084 mapValue!18084))))

(declare-fun res!247340 () Bool)

(declare-fun e!251634 () Bool)

(assert (=> start!39542 (=> (not res!247340) (not e!251634))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25806 0))(
  ( (array!25807 (arr!12352 (Array (_ BitVec 32) (_ BitVec 64))) (size!12704 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25806)

(assert (=> start!39542 (= res!247340 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12704 _keys!709))))))

(assert (=> start!39542 e!251634))

(declare-fun tp_is_empty!10975 () Bool)

(assert (=> start!39542 tp_is_empty!10975))

(assert (=> start!39542 tp!34997))

(assert (=> start!39542 true))

(declare-fun e!251633 () Bool)

(declare-fun array_inv!9074 (array!25804) Bool)

(assert (=> start!39542 (and (array_inv!9074 _values!549) e!251633)))

(declare-fun array_inv!9075 (array!25806) Bool)

(assert (=> start!39542 (array_inv!9075 _keys!709)))

(declare-fun b!423215 () Bool)

(declare-fun res!247339 () Bool)

(assert (=> b!423215 (=> (not res!247339) (not e!251634))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423215 (= res!247339 (or (= (select (arr!12352 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12352 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423216 () Bool)

(declare-fun res!247337 () Bool)

(assert (=> b!423216 (=> (not res!247337) (not e!251634))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423216 (= res!247337 (and (= (size!12703 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12704 _keys!709) (size!12703 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423217 () Bool)

(declare-fun res!247344 () Bool)

(assert (=> b!423217 (=> (not res!247344) (not e!251634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423217 (= res!247344 (validMask!0 mask!1025))))

(declare-fun b!423218 () Bool)

(declare-fun e!251636 () Bool)

(assert (=> b!423218 (= e!251634 e!251636)))

(declare-fun res!247343 () Bool)

(assert (=> b!423218 (=> (not res!247343) (not e!251636))))

(declare-fun lt!194153 () array!25806)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25806 (_ BitVec 32)) Bool)

(assert (=> b!423218 (= res!247343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194153 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423218 (= lt!194153 (array!25807 (store (arr!12352 _keys!709) i!563 k0!794) (size!12704 _keys!709)))))

(declare-fun b!423219 () Bool)

(declare-fun res!247334 () Bool)

(assert (=> b!423219 (=> (not res!247334) (not e!251634))))

(assert (=> b!423219 (= res!247334 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12704 _keys!709))))))

(declare-fun b!423220 () Bool)

(declare-fun res!247336 () Bool)

(assert (=> b!423220 (=> (not res!247336) (not e!251636))))

(declare-datatypes ((List!7153 0))(
  ( (Nil!7150) (Cons!7149 (h!8005 (_ BitVec 64)) (t!12589 List!7153)) )
))
(declare-fun arrayNoDuplicates!0 (array!25806 (_ BitVec 32) List!7153) Bool)

(assert (=> b!423220 (= res!247336 (arrayNoDuplicates!0 lt!194153 #b00000000000000000000000000000000 Nil!7150))))

(declare-fun b!423221 () Bool)

(declare-fun res!247338 () Bool)

(assert (=> b!423221 (=> (not res!247338) (not e!251634))))

(assert (=> b!423221 (= res!247338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423222 () Bool)

(declare-fun e!251638 () Bool)

(assert (=> b!423222 (= e!251633 (and e!251638 mapRes!18084))))

(declare-fun condMapEmpty!18084 () Bool)

(declare-fun mapDefault!18084 () ValueCell!5144)

(assert (=> b!423222 (= condMapEmpty!18084 (= (arr!12351 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5144)) mapDefault!18084)))))

(declare-fun b!423223 () Bool)

(declare-fun res!247333 () Bool)

(assert (=> b!423223 (=> (not res!247333) (not e!251634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423223 (= res!247333 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18084 () Bool)

(assert (=> mapIsEmpty!18084 mapRes!18084))

(declare-fun b!423224 () Bool)

(declare-fun res!247342 () Bool)

(assert (=> b!423224 (=> (not res!247342) (not e!251634))))

(assert (=> b!423224 (= res!247342 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7150))))

(declare-fun b!423225 () Bool)

(assert (=> b!423225 (= e!251636 false)))

(declare-fun zeroValue!515 () V!15739)

(declare-fun v!412 () V!15739)

(declare-fun minValue!515 () V!15739)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7150 0))(
  ( (tuple2!7151 (_1!3586 (_ BitVec 64)) (_2!3586 V!15739)) )
))
(declare-datatypes ((List!7154 0))(
  ( (Nil!7151) (Cons!7150 (h!8006 tuple2!7150) (t!12590 List!7154)) )
))
(declare-datatypes ((ListLongMap!6065 0))(
  ( (ListLongMap!6066 (toList!3048 List!7154)) )
))
(declare-fun lt!194154 () ListLongMap!6065)

(declare-fun getCurrentListMapNoExtraKeys!1294 (array!25806 array!25804 (_ BitVec 32) (_ BitVec 32) V!15739 V!15739 (_ BitVec 32) Int) ListLongMap!6065)

(assert (=> b!423225 (= lt!194154 (getCurrentListMapNoExtraKeys!1294 lt!194153 (array!25805 (store (arr!12351 _values!549) i!563 (ValueCellFull!5144 v!412)) (size!12703 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194152 () ListLongMap!6065)

(assert (=> b!423225 (= lt!194152 (getCurrentListMapNoExtraKeys!1294 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423226 () Bool)

(declare-fun res!247335 () Bool)

(assert (=> b!423226 (=> (not res!247335) (not e!251636))))

(assert (=> b!423226 (= res!247335 (bvsle from!863 i!563))))

(declare-fun b!423227 () Bool)

(assert (=> b!423227 (= e!251637 tp_is_empty!10975)))

(declare-fun b!423228 () Bool)

(assert (=> b!423228 (= e!251638 tp_is_empty!10975)))

(declare-fun b!423229 () Bool)

(declare-fun res!247341 () Bool)

(assert (=> b!423229 (=> (not res!247341) (not e!251634))))

(declare-fun arrayContainsKey!0 (array!25806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423229 (= res!247341 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39542 res!247340) b!423217))

(assert (= (and b!423217 res!247344) b!423216))

(assert (= (and b!423216 res!247337) b!423221))

(assert (= (and b!423221 res!247338) b!423224))

(assert (= (and b!423224 res!247342) b!423219))

(assert (= (and b!423219 res!247334) b!423223))

(assert (= (and b!423223 res!247333) b!423215))

(assert (= (and b!423215 res!247339) b!423229))

(assert (= (and b!423229 res!247341) b!423218))

(assert (= (and b!423218 res!247343) b!423220))

(assert (= (and b!423220 res!247336) b!423226))

(assert (= (and b!423226 res!247335) b!423225))

(assert (= (and b!423222 condMapEmpty!18084) mapIsEmpty!18084))

(assert (= (and b!423222 (not condMapEmpty!18084)) mapNonEmpty!18084))

(get-info :version)

(assert (= (and mapNonEmpty!18084 ((_ is ValueCellFull!5144) mapValue!18084)) b!423227))

(assert (= (and b!423222 ((_ is ValueCellFull!5144) mapDefault!18084)) b!423228))

(assert (= start!39542 b!423222))

(declare-fun m!413021 () Bool)

(assert (=> b!423220 m!413021))

(declare-fun m!413023 () Bool)

(assert (=> b!423224 m!413023))

(declare-fun m!413025 () Bool)

(assert (=> b!423229 m!413025))

(declare-fun m!413027 () Bool)

(assert (=> b!423223 m!413027))

(declare-fun m!413029 () Bool)

(assert (=> mapNonEmpty!18084 m!413029))

(declare-fun m!413031 () Bool)

(assert (=> b!423225 m!413031))

(declare-fun m!413033 () Bool)

(assert (=> b!423225 m!413033))

(declare-fun m!413035 () Bool)

(assert (=> b!423225 m!413035))

(declare-fun m!413037 () Bool)

(assert (=> b!423218 m!413037))

(declare-fun m!413039 () Bool)

(assert (=> b!423218 m!413039))

(declare-fun m!413041 () Bool)

(assert (=> b!423215 m!413041))

(declare-fun m!413043 () Bool)

(assert (=> b!423217 m!413043))

(declare-fun m!413045 () Bool)

(assert (=> b!423221 m!413045))

(declare-fun m!413047 () Bool)

(assert (=> start!39542 m!413047))

(declare-fun m!413049 () Bool)

(assert (=> start!39542 m!413049))

(check-sat (not b!423218) (not b_next!9823) (not b!423224) (not b!423229) (not b!423225) (not b!423220) (not b!423223) b_and!17493 (not b!423221) tp_is_empty!10975 (not start!39542) (not mapNonEmpty!18084) (not b!423217))
(check-sat b_and!17493 (not b_next!9823))
