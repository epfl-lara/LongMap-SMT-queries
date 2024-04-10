; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20596 () Bool)

(assert start!20596)

(declare-fun b_free!5255 () Bool)

(declare-fun b_next!5255 () Bool)

(assert (=> start!20596 (= b_free!5255 (not b_next!5255))))

(declare-fun tp!18797 () Bool)

(declare-fun b_and!12001 () Bool)

(assert (=> start!20596 (= tp!18797 b_and!12001)))

(declare-fun b!205236 () Bool)

(declare-fun res!99104 () Bool)

(declare-fun e!134227 () Bool)

(assert (=> b!205236 (=> (not res!99104) (not e!134227))))

(declare-datatypes ((array!9435 0))(
  ( (array!9436 (arr!4468 (Array (_ BitVec 32) (_ BitVec 64))) (size!4793 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9435)

(declare-datatypes ((List!2841 0))(
  ( (Nil!2838) (Cons!2837 (h!3479 (_ BitVec 64)) (t!7772 List!2841)) )
))
(declare-fun arrayNoDuplicates!0 (array!9435 (_ BitVec 32) List!2841) Bool)

(assert (=> b!205236 (= res!99104 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2838))))

(declare-fun b!205237 () Bool)

(declare-fun res!99109 () Bool)

(assert (=> b!205237 (=> (not res!99109) (not e!134227))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6461 0))(
  ( (V!6462 (val!2600 Int)) )
))
(declare-datatypes ((ValueCell!2212 0))(
  ( (ValueCellFull!2212 (v!4570 V!6461)) (EmptyCell!2212) )
))
(declare-datatypes ((array!9437 0))(
  ( (array!9438 (arr!4469 (Array (_ BitVec 32) ValueCell!2212)) (size!4794 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9437)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205237 (= res!99109 (and (= (size!4794 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4793 _keys!825) (size!4794 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205238 () Bool)

(declare-fun e!134230 () Bool)

(declare-fun tp_is_empty!5111 () Bool)

(assert (=> b!205238 (= e!134230 tp_is_empty!5111)))

(declare-fun b!205239 () Bool)

(declare-fun res!99105 () Bool)

(assert (=> b!205239 (=> (not res!99105) (not e!134227))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205239 (= res!99105 (= (select (arr!4468 _keys!825) i!601) k!843))))

(declare-fun b!205240 () Bool)

(declare-fun res!99108 () Bool)

(assert (=> b!205240 (=> (not res!99108) (not e!134227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9435 (_ BitVec 32)) Bool)

(assert (=> b!205240 (= res!99108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205241 () Bool)

(declare-fun res!99110 () Bool)

(assert (=> b!205241 (=> (not res!99110) (not e!134227))))

(assert (=> b!205241 (= res!99110 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4793 _keys!825))))))

(declare-fun b!205242 () Bool)

(declare-fun e!134226 () Bool)

(declare-fun e!134229 () Bool)

(assert (=> b!205242 (= e!134226 e!134229)))

(declare-fun res!99107 () Bool)

(assert (=> b!205242 (=> res!99107 e!134229)))

(assert (=> b!205242 (= res!99107 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3942 0))(
  ( (tuple2!3943 (_1!1982 (_ BitVec 64)) (_2!1982 V!6461)) )
))
(declare-datatypes ((List!2842 0))(
  ( (Nil!2839) (Cons!2838 (h!3480 tuple2!3942) (t!7773 List!2842)) )
))
(declare-datatypes ((ListLongMap!2855 0))(
  ( (ListLongMap!2856 (toList!1443 List!2842)) )
))
(declare-fun lt!104369 () ListLongMap!2855)

(declare-fun lt!104374 () ListLongMap!2855)

(assert (=> b!205242 (= lt!104369 lt!104374)))

(declare-fun lt!104377 () ListLongMap!2855)

(declare-fun lt!104376 () tuple2!3942)

(declare-fun +!470 (ListLongMap!2855 tuple2!3942) ListLongMap!2855)

(assert (=> b!205242 (= lt!104374 (+!470 lt!104377 lt!104376))))

(declare-fun lt!104375 () ListLongMap!2855)

(declare-fun lt!104371 () ListLongMap!2855)

(assert (=> b!205242 (= lt!104375 lt!104371)))

(declare-fun lt!104373 () ListLongMap!2855)

(assert (=> b!205242 (= lt!104371 (+!470 lt!104373 lt!104376))))

(declare-fun lt!104368 () ListLongMap!2855)

(assert (=> b!205242 (= lt!104375 (+!470 lt!104368 lt!104376))))

(declare-fun minValue!615 () V!6461)

(assert (=> b!205242 (= lt!104376 (tuple2!3943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205243 () Bool)

(assert (=> b!205243 (= e!134229 true)))

(declare-fun lt!104372 () tuple2!3942)

(assert (=> b!205243 (= lt!104371 (+!470 lt!104374 lt!104372))))

(declare-fun v!520 () V!6461)

(declare-datatypes ((Unit!6232 0))(
  ( (Unit!6233) )
))
(declare-fun lt!104379 () Unit!6232)

(declare-fun addCommutativeForDiffKeys!174 (ListLongMap!2855 (_ BitVec 64) V!6461 (_ BitVec 64) V!6461) Unit!6232)

(assert (=> b!205243 (= lt!104379 (addCommutativeForDiffKeys!174 lt!104377 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8735 () Bool)

(declare-fun mapRes!8735 () Bool)

(declare-fun tp!18796 () Bool)

(assert (=> mapNonEmpty!8735 (= mapRes!8735 (and tp!18796 e!134230))))

(declare-fun mapRest!8735 () (Array (_ BitVec 32) ValueCell!2212))

(declare-fun mapKey!8735 () (_ BitVec 32))

(declare-fun mapValue!8735 () ValueCell!2212)

(assert (=> mapNonEmpty!8735 (= (arr!4469 _values!649) (store mapRest!8735 mapKey!8735 mapValue!8735))))

(declare-fun b!205245 () Bool)

(declare-fun e!134228 () Bool)

(declare-fun e!134231 () Bool)

(assert (=> b!205245 (= e!134228 (and e!134231 mapRes!8735))))

(declare-fun condMapEmpty!8735 () Bool)

(declare-fun mapDefault!8735 () ValueCell!2212)

