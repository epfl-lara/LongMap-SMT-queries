; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90246 () Bool)

(assert start!90246)

(declare-fun b!1033140 () Bool)

(declare-fun b_free!20765 () Bool)

(declare-fun b_next!20765 () Bool)

(assert (=> b!1033140 (= b_free!20765 (not b_next!20765))))

(declare-fun tp!73388 () Bool)

(declare-fun b_and!33233 () Bool)

(assert (=> b!1033140 (= tp!73388 b_and!33233)))

(declare-fun b!1033134 () Bool)

(declare-fun e!583882 () Bool)

(declare-fun tp_is_empty!24485 () Bool)

(assert (=> b!1033134 (= e!583882 tp_is_empty!24485)))

(declare-fun b!1033135 () Bool)

(declare-fun e!583884 () Bool)

(declare-fun mapRes!38204 () Bool)

(assert (=> b!1033135 (= e!583884 (and e!583882 mapRes!38204))))

(declare-fun condMapEmpty!38204 () Bool)

(declare-datatypes ((V!37519 0))(
  ( (V!37520 (val!12293 Int)) )
))
(declare-datatypes ((ValueCell!11539 0))(
  ( (ValueCellFull!11539 (v!14870 V!37519)) (EmptyCell!11539) )
))
(declare-datatypes ((array!65046 0))(
  ( (array!65047 (arr!31319 (Array (_ BitVec 32) (_ BitVec 64))) (size!31841 (_ BitVec 32))) )
))
(declare-datatypes ((array!65048 0))(
  ( (array!65049 (arr!31320 (Array (_ BitVec 32) ValueCell!11539)) (size!31842 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5672 0))(
  ( (LongMapFixedSize!5673 (defaultEntry!6210 Int) (mask!30051 (_ BitVec 32)) (extraKeys!5942 (_ BitVec 32)) (zeroValue!6046 V!37519) (minValue!6046 V!37519) (_size!2891 (_ BitVec 32)) (_keys!11388 array!65046) (_values!6233 array!65048) (_vacant!2891 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5672)

(declare-fun mapDefault!38204 () ValueCell!11539)

