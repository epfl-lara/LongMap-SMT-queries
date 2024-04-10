; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33370 () Bool)

(assert start!33370)

(declare-fun mapNonEmpty!11370 () Bool)

(declare-fun mapRes!11370 () Bool)

(declare-fun tp!23745 () Bool)

(declare-fun e!203446 () Bool)

(assert (=> mapNonEmpty!11370 (= mapRes!11370 (and tp!23745 e!203446))))

(declare-datatypes ((V!9867 0))(
  ( (V!9868 (val!3378 Int)) )
))
(declare-datatypes ((ValueCell!2990 0))(
  ( (ValueCellFull!2990 (v!5536 V!9867)) (EmptyCell!2990) )
))
(declare-fun mapRest!11370 () (Array (_ BitVec 32) ValueCell!2990))

(declare-datatypes ((array!16925 0))(
  ( (array!16926 (arr!8002 (Array (_ BitVec 32) ValueCell!2990)) (size!8354 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16925)

(declare-fun mapKey!11370 () (_ BitVec 32))

(declare-fun mapValue!11370 () ValueCell!2990)

(assert (=> mapNonEmpty!11370 (= (arr!8002 _values!1525) (store mapRest!11370 mapKey!11370 mapValue!11370))))

(declare-fun mapIsEmpty!11370 () Bool)

(assert (=> mapIsEmpty!11370 mapRes!11370))

(declare-fun b!331583 () Bool)

(declare-fun e!203443 () Bool)

(declare-fun tp_is_empty!6667 () Bool)

(assert (=> b!331583 (= e!203443 tp_is_empty!6667)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun e!203445 () Bool)

(declare-fun b!331584 () Bool)

(declare-datatypes ((array!16927 0))(
  ( (array!16928 (arr!8003 (Array (_ BitVec 32) (_ BitVec 64))) (size!8355 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16927)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331584 (= e!203445 (and (= (size!8354 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8355 _keys!1895) (size!8354 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011) (= (size!8355 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)) (bvsgt #b00000000000000000000000000000000 (size!8355 _keys!1895))))))

(declare-fun b!331585 () Bool)

(declare-fun e!203442 () Bool)

(assert (=> b!331585 (= e!203442 (and e!203443 mapRes!11370))))

(declare-fun condMapEmpty!11370 () Bool)

(declare-fun mapDefault!11370 () ValueCell!2990)

