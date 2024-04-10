; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39658 () Bool)

(assert start!39658)

(declare-fun b_free!9925 () Bool)

(declare-fun b_next!9925 () Bool)

(assert (=> start!39658 (= b_free!9925 (not b_next!9925))))

(declare-fun tp!35304 () Bool)

(declare-fun b_and!17581 () Bool)

(assert (=> start!39658 (= tp!35304 b_and!17581)))

(declare-fun b!425615 () Bool)

(declare-fun e!252642 () Bool)

(assert (=> b!425615 (= e!252642 (not true))))

(declare-datatypes ((V!15875 0))(
  ( (V!15876 (val!5583 Int)) )
))
(declare-fun minValue!515 () V!15875)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5195 0))(
  ( (ValueCellFull!5195 (v!7830 V!15875)) (EmptyCell!5195) )
))
(declare-datatypes ((array!25993 0))(
  ( (array!25994 (arr!12446 (Array (_ BitVec 32) ValueCell!5195)) (size!12798 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25993)

(declare-datatypes ((array!25995 0))(
  ( (array!25996 (arr!12447 (Array (_ BitVec 32) (_ BitVec 64))) (size!12799 (_ BitVec 32))) )
))
(declare-fun lt!194708 () array!25995)

(declare-fun zeroValue!515 () V!15875)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!194705 () array!25993)

(declare-fun v!412 () V!15875)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25995)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7330 0))(
  ( (tuple2!7331 (_1!3676 (_ BitVec 64)) (_2!3676 V!15875)) )
))
(declare-datatypes ((List!7343 0))(
  ( (Nil!7340) (Cons!7339 (h!8195 tuple2!7330) (t!12787 List!7343)) )
))
(declare-datatypes ((ListLongMap!6243 0))(
  ( (ListLongMap!6244 (toList!3137 List!7343)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1341 (array!25995 array!25993 (_ BitVec 32) (_ BitVec 32) V!15875 V!15875 (_ BitVec 32) Int) ListLongMap!6243)

(declare-fun +!1295 (ListLongMap!6243 tuple2!7330) ListLongMap!6243)

(assert (=> b!425615 (= (getCurrentListMapNoExtraKeys!1341 lt!194708 lt!194705 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1295 (getCurrentListMapNoExtraKeys!1341 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7331 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12492 0))(
  ( (Unit!12493) )
))
(declare-fun lt!194707 () Unit!12492)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!490 (array!25995 array!25993 (_ BitVec 32) (_ BitVec 32) V!15875 V!15875 (_ BitVec 32) (_ BitVec 64) V!15875 (_ BitVec 32) Int) Unit!12492)

(assert (=> b!425615 (= lt!194707 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!490 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!249239 () Bool)

(declare-fun e!252641 () Bool)

(assert (=> start!39658 (=> (not res!249239) (not e!252641))))

(assert (=> start!39658 (= res!249239 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12799 _keys!709))))))

(assert (=> start!39658 e!252641))

(declare-fun tp_is_empty!11077 () Bool)

(assert (=> start!39658 tp_is_empty!11077))

(assert (=> start!39658 tp!35304))

(assert (=> start!39658 true))

(declare-fun e!252640 () Bool)

(declare-fun array_inv!9070 (array!25993) Bool)

(assert (=> start!39658 (and (array_inv!9070 _values!549) e!252640)))

(declare-fun array_inv!9071 (array!25995) Bool)

(assert (=> start!39658 (array_inv!9071 _keys!709)))

(declare-fun b!425616 () Bool)

(declare-fun res!249234 () Bool)

(declare-fun e!252639 () Bool)

(assert (=> b!425616 (=> (not res!249234) (not e!252639))))

(assert (=> b!425616 (= res!249234 (bvsle from!863 i!563))))

(declare-fun b!425617 () Bool)

(declare-fun res!249229 () Bool)

(assert (=> b!425617 (=> (not res!249229) (not e!252641))))

(declare-datatypes ((List!7344 0))(
  ( (Nil!7341) (Cons!7340 (h!8196 (_ BitVec 64)) (t!12788 List!7344)) )
))
(declare-fun arrayNoDuplicates!0 (array!25995 (_ BitVec 32) List!7344) Bool)

(assert (=> b!425617 (= res!249229 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7341))))

(declare-fun mapNonEmpty!18237 () Bool)

(declare-fun mapRes!18237 () Bool)

(declare-fun tp!35303 () Bool)

(declare-fun e!252645 () Bool)

(assert (=> mapNonEmpty!18237 (= mapRes!18237 (and tp!35303 e!252645))))

(declare-fun mapRest!18237 () (Array (_ BitVec 32) ValueCell!5195))

(declare-fun mapValue!18237 () ValueCell!5195)

(declare-fun mapKey!18237 () (_ BitVec 32))

(assert (=> mapNonEmpty!18237 (= (arr!12446 _values!549) (store mapRest!18237 mapKey!18237 mapValue!18237))))

(declare-fun b!425618 () Bool)

(assert (=> b!425618 (= e!252645 tp_is_empty!11077)))

(declare-fun b!425619 () Bool)

(declare-fun res!249236 () Bool)

(assert (=> b!425619 (=> (not res!249236) (not e!252641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25995 (_ BitVec 32)) Bool)

(assert (=> b!425619 (= res!249236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425620 () Bool)

(declare-fun res!249235 () Bool)

(assert (=> b!425620 (=> (not res!249235) (not e!252641))))

(assert (=> b!425620 (= res!249235 (and (= (size!12798 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12799 _keys!709) (size!12798 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425621 () Bool)

(declare-fun res!249231 () Bool)

(assert (=> b!425621 (=> (not res!249231) (not e!252639))))

(assert (=> b!425621 (= res!249231 (arrayNoDuplicates!0 lt!194708 #b00000000000000000000000000000000 Nil!7341))))

(declare-fun b!425622 () Bool)

(declare-fun e!252643 () Bool)

(assert (=> b!425622 (= e!252640 (and e!252643 mapRes!18237))))

(declare-fun condMapEmpty!18237 () Bool)

(declare-fun mapDefault!18237 () ValueCell!5195)

