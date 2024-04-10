; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41072 () Bool)

(assert start!41072)

(declare-fun b_free!10985 () Bool)

(declare-fun b_next!10985 () Bool)

(assert (=> start!41072 (= b_free!10985 (not b_next!10985))))

(declare-fun tp!38785 () Bool)

(declare-fun b_and!19177 () Bool)

(assert (=> start!41072 (= tp!38785 b_and!19177)))

(declare-fun b!458144 () Bool)

(declare-fun res!273692 () Bool)

(declare-fun e!267491 () Bool)

(assert (=> b!458144 (=> (not res!273692) (not e!267491))))

(declare-datatypes ((array!28447 0))(
  ( (array!28448 (arr!13666 (Array (_ BitVec 32) (_ BitVec 64))) (size!14018 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28447)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458144 (= res!273692 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!458145 () Bool)

(declare-fun e!267497 () Bool)

(declare-fun tp_is_empty!12323 () Bool)

(assert (=> b!458145 (= e!267497 tp_is_empty!12323)))

(declare-fun b!458146 () Bool)

(declare-fun res!273687 () Bool)

(assert (=> b!458146 (=> (not res!273687) (not e!267491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458146 (= res!273687 (validKeyInArray!0 k!794))))

(declare-fun b!458147 () Bool)

(declare-fun res!273684 () Bool)

(declare-fun e!267494 () Bool)

(assert (=> b!458147 (=> (not res!273684) (not e!267494))))

(declare-fun lt!207240 () array!28447)

(declare-datatypes ((List!8250 0))(
  ( (Nil!8247) (Cons!8246 (h!9102 (_ BitVec 64)) (t!14114 List!8250)) )
))
(declare-fun arrayNoDuplicates!0 (array!28447 (_ BitVec 32) List!8250) Bool)

(assert (=> b!458147 (= res!273684 (arrayNoDuplicates!0 lt!207240 #b00000000000000000000000000000000 Nil!8247))))

(declare-fun mapIsEmpty!20128 () Bool)

(declare-fun mapRes!20128 () Bool)

(assert (=> mapIsEmpty!20128 mapRes!20128))

(declare-fun b!458148 () Bool)

(declare-fun e!267496 () Bool)

(assert (=> b!458148 (= e!267496 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!17535 0))(
  ( (V!17536 (val!6206 Int)) )
))
(declare-datatypes ((tuple2!8178 0))(
  ( (tuple2!8179 (_1!4100 (_ BitVec 64)) (_2!4100 V!17535)) )
))
(declare-datatypes ((List!8251 0))(
  ( (Nil!8248) (Cons!8247 (h!9103 tuple2!8178) (t!14115 List!8251)) )
))
(declare-datatypes ((ListLongMap!7091 0))(
  ( (ListLongMap!7092 (toList!3561 List!8251)) )
))
(declare-fun lt!207239 () ListLongMap!7091)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5818 0))(
  ( (ValueCellFull!5818 (v!8476 V!17535)) (EmptyCell!5818) )
))
(declare-datatypes ((array!28449 0))(
  ( (array!28450 (arr!13667 (Array (_ BitVec 32) ValueCell!5818)) (size!14019 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28449)

(declare-fun lt!207235 () ListLongMap!7091)

(declare-fun +!1597 (ListLongMap!7091 tuple2!8178) ListLongMap!7091)

(declare-fun get!6730 (ValueCell!5818 V!17535) V!17535)

(declare-fun dynLambda!886 (Int (_ BitVec 64)) V!17535)

(assert (=> b!458148 (= lt!207235 (+!1597 lt!207239 (tuple2!8179 (select (arr!13666 _keys!709) from!863) (get!6730 (select (arr!13667 _values!549) from!863) (dynLambda!886 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458150 () Bool)

(declare-fun res!273686 () Bool)

(assert (=> b!458150 (=> (not res!273686) (not e!267491))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!458150 (= res!273686 (and (= (size!14019 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14018 _keys!709) (size!14019 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458151 () Bool)

(declare-fun res!273690 () Bool)

(assert (=> b!458151 (=> (not res!273690) (not e!267491))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458151 (= res!273690 (or (= (select (arr!13666 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13666 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458152 () Bool)

(declare-fun res!273694 () Bool)

(assert (=> b!458152 (=> (not res!273694) (not e!267491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28447 (_ BitVec 32)) Bool)

(assert (=> b!458152 (= res!273694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458153 () Bool)

(declare-fun e!267493 () Bool)

(assert (=> b!458153 (= e!267493 (not e!267496))))

(declare-fun res!273691 () Bool)

(assert (=> b!458153 (=> res!273691 e!267496)))

(assert (=> b!458153 (= res!273691 (not (validKeyInArray!0 (select (arr!13666 _keys!709) from!863))))))

(declare-fun lt!207237 () ListLongMap!7091)

(assert (=> b!458153 (= lt!207237 lt!207239)))

(declare-fun lt!207233 () ListLongMap!7091)

(declare-fun v!412 () V!17535)

(assert (=> b!458153 (= lt!207239 (+!1597 lt!207233 (tuple2!8179 k!794 v!412)))))

(declare-fun minValue!515 () V!17535)

(declare-fun zeroValue!515 () V!17535)

(declare-fun lt!207234 () array!28449)

(declare-fun getCurrentListMapNoExtraKeys!1743 (array!28447 array!28449 (_ BitVec 32) (_ BitVec 32) V!17535 V!17535 (_ BitVec 32) Int) ListLongMap!7091)

(assert (=> b!458153 (= lt!207237 (getCurrentListMapNoExtraKeys!1743 lt!207240 lt!207234 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458153 (= lt!207233 (getCurrentListMapNoExtraKeys!1743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13314 0))(
  ( (Unit!13315) )
))
(declare-fun lt!207238 () Unit!13314)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!756 (array!28447 array!28449 (_ BitVec 32) (_ BitVec 32) V!17535 V!17535 (_ BitVec 32) (_ BitVec 64) V!17535 (_ BitVec 32) Int) Unit!13314)

(assert (=> b!458153 (= lt!207238 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!756 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458154 () Bool)

(declare-fun res!273696 () Bool)

(assert (=> b!458154 (=> (not res!273696) (not e!267491))))

(assert (=> b!458154 (= res!273696 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14018 _keys!709))))))

(declare-fun b!458155 () Bool)

(assert (=> b!458155 (= e!267494 e!267493)))

(declare-fun res!273683 () Bool)

(assert (=> b!458155 (=> (not res!273683) (not e!267493))))

(assert (=> b!458155 (= res!273683 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!458155 (= lt!207235 (getCurrentListMapNoExtraKeys!1743 lt!207240 lt!207234 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458155 (= lt!207234 (array!28450 (store (arr!13667 _values!549) i!563 (ValueCellFull!5818 v!412)) (size!14019 _values!549)))))

(declare-fun lt!207236 () ListLongMap!7091)

(assert (=> b!458155 (= lt!207236 (getCurrentListMapNoExtraKeys!1743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458156 () Bool)

(declare-fun res!273688 () Bool)

(assert (=> b!458156 (=> (not res!273688) (not e!267491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458156 (= res!273688 (validMask!0 mask!1025))))

(declare-fun b!458157 () Bool)

(declare-fun res!273689 () Bool)

(assert (=> b!458157 (=> (not res!273689) (not e!267494))))

(assert (=> b!458157 (= res!273689 (bvsle from!863 i!563))))

(declare-fun b!458149 () Bool)

(assert (=> b!458149 (= e!267491 e!267494)))

(declare-fun res!273685 () Bool)

(assert (=> b!458149 (=> (not res!273685) (not e!267494))))

(assert (=> b!458149 (= res!273685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207240 mask!1025))))

(assert (=> b!458149 (= lt!207240 (array!28448 (store (arr!13666 _keys!709) i!563 k!794) (size!14018 _keys!709)))))

(declare-fun res!273693 () Bool)

(assert (=> start!41072 (=> (not res!273693) (not e!267491))))

(assert (=> start!41072 (= res!273693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14018 _keys!709))))))

(assert (=> start!41072 e!267491))

(assert (=> start!41072 tp_is_empty!12323))

(assert (=> start!41072 tp!38785))

(assert (=> start!41072 true))

(declare-fun e!267492 () Bool)

(declare-fun array_inv!9894 (array!28449) Bool)

(assert (=> start!41072 (and (array_inv!9894 _values!549) e!267492)))

(declare-fun array_inv!9895 (array!28447) Bool)

(assert (=> start!41072 (array_inv!9895 _keys!709)))

(declare-fun mapNonEmpty!20128 () Bool)

(declare-fun tp!38784 () Bool)

(declare-fun e!267495 () Bool)

(assert (=> mapNonEmpty!20128 (= mapRes!20128 (and tp!38784 e!267495))))

(declare-fun mapRest!20128 () (Array (_ BitVec 32) ValueCell!5818))

(declare-fun mapValue!20128 () ValueCell!5818)

(declare-fun mapKey!20128 () (_ BitVec 32))

(assert (=> mapNonEmpty!20128 (= (arr!13667 _values!549) (store mapRest!20128 mapKey!20128 mapValue!20128))))

(declare-fun b!458158 () Bool)

(assert (=> b!458158 (= e!267492 (and e!267497 mapRes!20128))))

(declare-fun condMapEmpty!20128 () Bool)

(declare-fun mapDefault!20128 () ValueCell!5818)

