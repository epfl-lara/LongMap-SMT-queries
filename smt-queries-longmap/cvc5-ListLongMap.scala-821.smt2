; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20010 () Bool)

(assert start!20010)

(declare-fun mapIsEmpty!7871 () Bool)

(declare-fun mapRes!7871 () Bool)

(assert (=> mapIsEmpty!7871 mapRes!7871))

(declare-fun b!196034 () Bool)

(declare-fun e!129053 () Bool)

(declare-fun tp_is_empty!4537 () Bool)

(assert (=> b!196034 (= e!129053 tp_is_empty!4537)))

(declare-fun b!196035 () Bool)

(declare-fun res!92500 () Bool)

(declare-fun e!129050 () Bool)

(assert (=> b!196035 (=> (not res!92500) (not e!129050))))

(declare-datatypes ((array!8335 0))(
  ( (array!8336 (arr!3919 (Array (_ BitVec 32) (_ BitVec 64))) (size!4244 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8335)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8335 (_ BitVec 32)) Bool)

(assert (=> b!196035 (= res!92500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196037 () Bool)

(declare-fun e!129054 () Bool)

(declare-datatypes ((List!2458 0))(
  ( (Nil!2455) (Cons!2454 (h!3096 (_ BitVec 64)) (t!7389 List!2458)) )
))
(declare-fun contains!1386 (List!2458 (_ BitVec 64)) Bool)

(assert (=> b!196037 (= e!129054 (contains!1386 Nil!2455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196038 () Bool)

(assert (=> b!196038 (= e!129050 e!129054)))

(declare-fun res!92501 () Bool)

(assert (=> b!196038 (=> res!92501 e!129054)))

(assert (=> b!196038 (= res!92501 (contains!1386 Nil!2455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196039 () Bool)

(declare-fun res!92502 () Bool)

(assert (=> b!196039 (=> (not res!92502) (not e!129050))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5697 0))(
  ( (V!5698 (val!2313 Int)) )
))
(declare-datatypes ((ValueCell!1925 0))(
  ( (ValueCellFull!1925 (v!4282 V!5697)) (EmptyCell!1925) )
))
(declare-datatypes ((array!8337 0))(
  ( (array!8338 (arr!3920 (Array (_ BitVec 32) ValueCell!1925)) (size!4245 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8337)

(assert (=> b!196039 (= res!92502 (and (= (size!4245 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4244 _keys!825) (size!4245 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196040 () Bool)

(declare-fun res!92504 () Bool)

(assert (=> b!196040 (=> (not res!92504) (not e!129050))))

(declare-fun noDuplicate!60 (List!2458) Bool)

(assert (=> b!196040 (= res!92504 (noDuplicate!60 Nil!2455))))

(declare-fun mapNonEmpty!7871 () Bool)

(declare-fun tp!17159 () Bool)

(assert (=> mapNonEmpty!7871 (= mapRes!7871 (and tp!17159 e!129053))))

(declare-fun mapValue!7871 () ValueCell!1925)

(declare-fun mapRest!7871 () (Array (_ BitVec 32) ValueCell!1925))

(declare-fun mapKey!7871 () (_ BitVec 32))

(assert (=> mapNonEmpty!7871 (= (arr!3920 _values!649) (store mapRest!7871 mapKey!7871 mapValue!7871))))

(declare-fun b!196041 () Bool)

(declare-fun e!129051 () Bool)

(assert (=> b!196041 (= e!129051 tp_is_empty!4537)))

(declare-fun b!196042 () Bool)

(declare-fun e!129049 () Bool)

(assert (=> b!196042 (= e!129049 (and e!129051 mapRes!7871))))

(declare-fun condMapEmpty!7871 () Bool)

(declare-fun mapDefault!7871 () ValueCell!1925)

