; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9584 () Bool)

(assert start!9584)

(declare-fun b!70519 () Bool)

(declare-fun b_free!2089 () Bool)

(declare-fun b_next!2089 () Bool)

(assert (=> b!70519 (= b_free!2089 (not b_next!2089))))

(declare-fun tp!8435 () Bool)

(declare-fun b_and!4327 () Bool)

(assert (=> b!70519 (= tp!8435 b_and!4327)))

(declare-fun b!70525 () Bool)

(declare-fun b_free!2091 () Bool)

(declare-fun b_next!2091 () Bool)

(assert (=> b!70525 (= b_free!2091 (not b_next!2091))))

(declare-fun tp!8436 () Bool)

(declare-fun b_and!4329 () Bool)

(assert (=> b!70525 (= tp!8436 b_and!4329)))

(declare-fun b!70510 () Bool)

(declare-fun e!46136 () Bool)

(declare-fun tp_is_empty!2461 () Bool)

(assert (=> b!70510 (= e!46136 tp_is_empty!2461)))

(declare-fun b!70511 () Bool)

(declare-fun e!46142 () Bool)

(declare-fun e!46141 () Bool)

(declare-fun mapRes!3122 () Bool)

(assert (=> b!70511 (= e!46142 (and e!46141 mapRes!3122))))

(declare-fun condMapEmpty!3122 () Bool)

(declare-datatypes ((V!2929 0))(
  ( (V!2930 (val!1275 Int)) )
))
(declare-datatypes ((array!3865 0))(
  ( (array!3866 (arr!1845 (Array (_ BitVec 32) (_ BitVec 64))) (size!2082 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!887 0))(
  ( (ValueCellFull!887 (v!2507 V!2929)) (EmptyCell!887) )
))
(declare-datatypes ((array!3867 0))(
  ( (array!3868 (arr!1846 (Array (_ BitVec 32) ValueCell!887)) (size!2083 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!682 0))(
  ( (LongMapFixedSize!683 (defaultEntry!2188 Int) (mask!6143 (_ BitVec 32)) (extraKeys!2051 (_ BitVec 32)) (zeroValue!2092 V!2929) (minValue!2092 V!2929) (_size!390 (_ BitVec 32)) (_keys!3836 array!3865) (_values!2171 array!3867) (_vacant!390 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!682)

(declare-fun mapDefault!3121 () ValueCell!887)

