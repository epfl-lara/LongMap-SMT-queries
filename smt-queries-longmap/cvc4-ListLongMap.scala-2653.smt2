; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39740 () Bool)

(assert start!39740)

(declare-fun b_free!10007 () Bool)

(declare-fun b_next!10007 () Bool)

(assert (=> start!39740 (= b_free!10007 (not b_next!10007))))

(declare-fun tp!35549 () Bool)

(declare-fun b_and!17673 () Bool)

(assert (=> start!39740 (= tp!35549 b_and!17673)))

(declare-fun b!427619 () Bool)

(declare-fun res!250857 () Bool)

(declare-fun e!253531 () Bool)

(assert (=> b!427619 (=> (not res!250857) (not e!253531))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427619 (= res!250857 (validMask!0 mask!1025))))

(declare-fun b!427620 () Bool)

(declare-fun e!253530 () Bool)

(declare-fun tp_is_empty!11159 () Bool)

(assert (=> b!427620 (= e!253530 tp_is_empty!11159)))

(declare-fun b!427621 () Bool)

(declare-fun e!253532 () Bool)

(assert (=> b!427621 (= e!253532 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!15983 0))(
  ( (V!15984 (val!5624 Int)) )
))
(declare-datatypes ((ValueCell!5236 0))(
  ( (ValueCellFull!5236 (v!7871 V!15983)) (EmptyCell!5236) )
))
(declare-datatypes ((array!26155 0))(
  ( (array!26156 (arr!12527 (Array (_ BitVec 32) ValueCell!5236)) (size!12879 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26155)

(declare-datatypes ((array!26157 0))(
  ( (array!26158 (arr!12528 (Array (_ BitVec 32) (_ BitVec 64))) (size!12880 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26157)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7394 0))(
  ( (tuple2!7395 (_1!3708 (_ BitVec 64)) (_2!3708 V!15983)) )
))
(declare-datatypes ((List!7407 0))(
  ( (Nil!7404) (Cons!7403 (h!8259 tuple2!7394) (t!12863 List!7407)) )
))
(declare-datatypes ((ListLongMap!6307 0))(
  ( (ListLongMap!6308 (toList!3169 List!7407)) )
))
(declare-fun lt!195377 () ListLongMap!6307)

(declare-fun lt!195376 () ListLongMap!6307)

(declare-fun +!1324 (ListLongMap!6307 tuple2!7394) ListLongMap!6307)

(declare-fun get!6201 (ValueCell!5236 V!15983) V!15983)

(declare-fun dynLambda!752 (Int (_ BitVec 64)) V!15983)

(assert (=> b!427621 (= lt!195377 (+!1324 lt!195376 (tuple2!7395 (select (arr!12528 _keys!709) from!863) (get!6201 (select (arr!12527 _values!549) from!863) (dynLambda!752 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427622 () Bool)

(declare-fun e!253533 () Bool)

(assert (=> b!427622 (= e!253533 tp_is_empty!11159)))

(declare-fun b!427623 () Bool)

(declare-fun res!250866 () Bool)

(assert (=> b!427623 (=> (not res!250866) (not e!253531))))

(declare-datatypes ((List!7408 0))(
  ( (Nil!7405) (Cons!7404 (h!8260 (_ BitVec 64)) (t!12864 List!7408)) )
))
(declare-fun arrayNoDuplicates!0 (array!26157 (_ BitVec 32) List!7408) Bool)

(assert (=> b!427623 (= res!250866 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7405))))

(declare-fun b!427624 () Bool)

(declare-fun res!250859 () Bool)

(assert (=> b!427624 (=> (not res!250859) (not e!253531))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427624 (= res!250859 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!250863 () Bool)

(assert (=> start!39740 (=> (not res!250863) (not e!253531))))

(assert (=> start!39740 (= res!250863 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12880 _keys!709))))))

(assert (=> start!39740 e!253531))

(assert (=> start!39740 tp_is_empty!11159))

(assert (=> start!39740 tp!35549))

(assert (=> start!39740 true))

(declare-fun e!253526 () Bool)

(declare-fun array_inv!9130 (array!26155) Bool)

(assert (=> start!39740 (and (array_inv!9130 _values!549) e!253526)))

(declare-fun array_inv!9131 (array!26157) Bool)

(assert (=> start!39740 (array_inv!9131 _keys!709)))

(declare-fun b!427625 () Bool)

(declare-fun res!250865 () Bool)

(declare-fun e!253527 () Bool)

(assert (=> b!427625 (=> (not res!250865) (not e!253527))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427625 (= res!250865 (bvsle from!863 i!563))))

(declare-fun b!427626 () Bool)

(declare-fun res!250862 () Bool)

(assert (=> b!427626 (=> (not res!250862) (not e!253531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26157 (_ BitVec 32)) Bool)

(assert (=> b!427626 (= res!250862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427627 () Bool)

(declare-fun res!250858 () Bool)

(assert (=> b!427627 (=> (not res!250858) (not e!253531))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!427627 (= res!250858 (and (= (size!12879 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12880 _keys!709) (size!12879 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427628 () Bool)

(declare-fun mapRes!18360 () Bool)

(assert (=> b!427628 (= e!253526 (and e!253530 mapRes!18360))))

(declare-fun condMapEmpty!18360 () Bool)

(declare-fun mapDefault!18360 () ValueCell!5236)

