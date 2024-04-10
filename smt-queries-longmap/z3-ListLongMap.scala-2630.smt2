; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39600 () Bool)

(assert start!39600)

(declare-fun b_free!9867 () Bool)

(declare-fun b_next!9867 () Bool)

(assert (=> start!39600 (= b_free!9867 (not b_next!9867))))

(declare-fun tp!35130 () Bool)

(declare-fun b_and!17523 () Bool)

(assert (=> start!39600 (= tp!35130 b_and!17523)))

(declare-fun res!248134 () Bool)

(declare-fun e!252061 () Bool)

(assert (=> start!39600 (=> (not res!248134) (not e!252061))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25877 0))(
  ( (array!25878 (arr!12388 (Array (_ BitVec 32) (_ BitVec 64))) (size!12740 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25877)

(assert (=> start!39600 (= res!248134 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12740 _keys!709))))))

(assert (=> start!39600 e!252061))

(declare-fun tp_is_empty!11019 () Bool)

(assert (=> start!39600 tp_is_empty!11019))

(assert (=> start!39600 tp!35130))

(assert (=> start!39600 true))

(declare-datatypes ((V!15797 0))(
  ( (V!15798 (val!5554 Int)) )
))
(declare-datatypes ((ValueCell!5166 0))(
  ( (ValueCellFull!5166 (v!7801 V!15797)) (EmptyCell!5166) )
))
(declare-datatypes ((array!25879 0))(
  ( (array!25880 (arr!12389 (Array (_ BitVec 32) ValueCell!5166)) (size!12741 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25879)

(declare-fun e!252062 () Bool)

(declare-fun array_inv!9028 (array!25879) Bool)

(assert (=> start!39600 (and (array_inv!9028 _values!549) e!252062)))

(declare-fun array_inv!9029 (array!25877) Bool)

(assert (=> start!39600 (array_inv!9029 _keys!709)))

(declare-fun b!424254 () Bool)

(declare-fun res!248129 () Bool)

(assert (=> b!424254 (=> (not res!248129) (not e!252061))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424254 (= res!248129 (validMask!0 mask!1025))))

(declare-fun b!424255 () Bool)

(declare-fun res!248137 () Bool)

(assert (=> b!424255 (=> (not res!248137) (not e!252061))))

(declare-datatypes ((List!7302 0))(
  ( (Nil!7299) (Cons!7298 (h!8154 (_ BitVec 64)) (t!12746 List!7302)) )
))
(declare-fun arrayNoDuplicates!0 (array!25877 (_ BitVec 32) List!7302) Bool)

(assert (=> b!424255 (= res!248137 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7299))))

(declare-fun b!424256 () Bool)

(declare-fun res!248138 () Bool)

(declare-fun e!252064 () Bool)

(assert (=> b!424256 (=> (not res!248138) (not e!252064))))

(declare-fun lt!194332 () array!25877)

(assert (=> b!424256 (= res!248138 (arrayNoDuplicates!0 lt!194332 #b00000000000000000000000000000000 Nil!7299))))

(declare-fun b!424257 () Bool)

(declare-fun res!248131 () Bool)

(assert (=> b!424257 (=> (not res!248131) (not e!252061))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424257 (= res!248131 (and (= (size!12741 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12740 _keys!709) (size!12741 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424258 () Bool)

(declare-fun res!248132 () Bool)

(assert (=> b!424258 (=> (not res!248132) (not e!252061))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424258 (= res!248132 (or (= (select (arr!12388 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12388 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424259 () Bool)

(declare-fun e!252066 () Bool)

(assert (=> b!424259 (= e!252066 tp_is_empty!11019)))

(declare-fun b!424260 () Bool)

(declare-fun e!252063 () Bool)

(assert (=> b!424260 (= e!252063 tp_is_empty!11019)))

(declare-fun mapNonEmpty!18150 () Bool)

(declare-fun mapRes!18150 () Bool)

(declare-fun tp!35129 () Bool)

(assert (=> mapNonEmpty!18150 (= mapRes!18150 (and tp!35129 e!252066))))

(declare-fun mapValue!18150 () ValueCell!5166)

(declare-fun mapKey!18150 () (_ BitVec 32))

(declare-fun mapRest!18150 () (Array (_ BitVec 32) ValueCell!5166))

(assert (=> mapNonEmpty!18150 (= (arr!12389 _values!549) (store mapRest!18150 mapKey!18150 mapValue!18150))))

(declare-fun mapIsEmpty!18150 () Bool)

(assert (=> mapIsEmpty!18150 mapRes!18150))

(declare-fun b!424261 () Bool)

(declare-fun res!248133 () Bool)

(assert (=> b!424261 (=> (not res!248133) (not e!252061))))

(assert (=> b!424261 (= res!248133 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12740 _keys!709))))))

(declare-fun b!424262 () Bool)

(assert (=> b!424262 (= e!252062 (and e!252063 mapRes!18150))))

(declare-fun condMapEmpty!18150 () Bool)

(declare-fun mapDefault!18150 () ValueCell!5166)

(assert (=> b!424262 (= condMapEmpty!18150 (= (arr!12389 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5166)) mapDefault!18150)))))

(declare-fun b!424263 () Bool)

(assert (=> b!424263 (= e!252061 e!252064)))

(declare-fun res!248128 () Bool)

(assert (=> b!424263 (=> (not res!248128) (not e!252064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25877 (_ BitVec 32)) Bool)

(assert (=> b!424263 (= res!248128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194332 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!424263 (= lt!194332 (array!25878 (store (arr!12388 _keys!709) i!563 k0!794) (size!12740 _keys!709)))))

(declare-fun b!424264 () Bool)

(declare-fun res!248139 () Bool)

(assert (=> b!424264 (=> (not res!248139) (not e!252061))))

(declare-fun arrayContainsKey!0 (array!25877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424264 (= res!248139 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424265 () Bool)

(declare-fun res!248135 () Bool)

(assert (=> b!424265 (=> (not res!248135) (not e!252061))))

(assert (=> b!424265 (= res!248135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424266 () Bool)

(declare-fun res!248130 () Bool)

(assert (=> b!424266 (=> (not res!248130) (not e!252064))))

(assert (=> b!424266 (= res!248130 (bvsle from!863 i!563))))

(declare-fun b!424267 () Bool)

(assert (=> b!424267 (= e!252064 false)))

(declare-fun minValue!515 () V!15797)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15797)

(declare-datatypes ((tuple2!7292 0))(
  ( (tuple2!7293 (_1!3657 (_ BitVec 64)) (_2!3657 V!15797)) )
))
(declare-datatypes ((List!7303 0))(
  ( (Nil!7300) (Cons!7299 (h!8155 tuple2!7292) (t!12747 List!7303)) )
))
(declare-datatypes ((ListLongMap!6205 0))(
  ( (ListLongMap!6206 (toList!3118 List!7303)) )
))
(declare-fun lt!194331 () ListLongMap!6205)

(declare-fun v!412 () V!15797)

(declare-fun getCurrentListMapNoExtraKeys!1322 (array!25877 array!25879 (_ BitVec 32) (_ BitVec 32) V!15797 V!15797 (_ BitVec 32) Int) ListLongMap!6205)

(assert (=> b!424267 (= lt!194331 (getCurrentListMapNoExtraKeys!1322 lt!194332 (array!25880 (store (arr!12389 _values!549) i!563 (ValueCellFull!5166 v!412)) (size!12741 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194333 () ListLongMap!6205)

(assert (=> b!424267 (= lt!194333 (getCurrentListMapNoExtraKeys!1322 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424268 () Bool)

(declare-fun res!248136 () Bool)

(assert (=> b!424268 (=> (not res!248136) (not e!252061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424268 (= res!248136 (validKeyInArray!0 k0!794))))

(assert (= (and start!39600 res!248134) b!424254))

(assert (= (and b!424254 res!248129) b!424257))

(assert (= (and b!424257 res!248131) b!424265))

(assert (= (and b!424265 res!248135) b!424255))

(assert (= (and b!424255 res!248137) b!424261))

(assert (= (and b!424261 res!248133) b!424268))

(assert (= (and b!424268 res!248136) b!424258))

(assert (= (and b!424258 res!248132) b!424264))

(assert (= (and b!424264 res!248139) b!424263))

(assert (= (and b!424263 res!248128) b!424256))

(assert (= (and b!424256 res!248138) b!424266))

(assert (= (and b!424266 res!248130) b!424267))

(assert (= (and b!424262 condMapEmpty!18150) mapIsEmpty!18150))

(assert (= (and b!424262 (not condMapEmpty!18150)) mapNonEmpty!18150))

(get-info :version)

(assert (= (and mapNonEmpty!18150 ((_ is ValueCellFull!5166) mapValue!18150)) b!424259))

(assert (= (and b!424262 ((_ is ValueCellFull!5166) mapDefault!18150)) b!424260))

(assert (= start!39600 b!424262))

(declare-fun m!413463 () Bool)

(assert (=> b!424265 m!413463))

(declare-fun m!413465 () Bool)

(assert (=> b!424264 m!413465))

(declare-fun m!413467 () Bool)

(assert (=> b!424263 m!413467))

(declare-fun m!413469 () Bool)

(assert (=> b!424263 m!413469))

(declare-fun m!413471 () Bool)

(assert (=> start!39600 m!413471))

(declare-fun m!413473 () Bool)

(assert (=> start!39600 m!413473))

(declare-fun m!413475 () Bool)

(assert (=> b!424267 m!413475))

(declare-fun m!413477 () Bool)

(assert (=> b!424267 m!413477))

(declare-fun m!413479 () Bool)

(assert (=> b!424267 m!413479))

(declare-fun m!413481 () Bool)

(assert (=> b!424254 m!413481))

(declare-fun m!413483 () Bool)

(assert (=> b!424258 m!413483))

(declare-fun m!413485 () Bool)

(assert (=> mapNonEmpty!18150 m!413485))

(declare-fun m!413487 () Bool)

(assert (=> b!424268 m!413487))

(declare-fun m!413489 () Bool)

(assert (=> b!424255 m!413489))

(declare-fun m!413491 () Bool)

(assert (=> b!424256 m!413491))

(check-sat (not b!424268) (not b!424255) (not b_next!9867) (not b!424264) (not b!424267) (not mapNonEmpty!18150) (not b!424265) (not b!424256) b_and!17523 (not start!39600) (not b!424263) (not b!424254) tp_is_empty!11019)
(check-sat b_and!17523 (not b_next!9867))
