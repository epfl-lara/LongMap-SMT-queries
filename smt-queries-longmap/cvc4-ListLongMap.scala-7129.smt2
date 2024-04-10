; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90476 () Bool)

(assert start!90476)

(declare-fun b!1035179 () Bool)

(declare-fun b_free!20831 () Bool)

(declare-fun b_next!20831 () Bool)

(assert (=> b!1035179 (= b_free!20831 (not b_next!20831))))

(declare-fun tp!73613 () Bool)

(declare-fun b_and!33331 () Bool)

(assert (=> b!1035179 (= tp!73613 b_and!33331)))

(declare-fun b!1035176 () Bool)

(declare-fun res!691234 () Bool)

(declare-fun e!585290 () Bool)

(assert (=> b!1035176 (=> (not res!691234) (not e!585290))))

(declare-datatypes ((V!37607 0))(
  ( (V!37608 (val!12326 Int)) )
))
(declare-datatypes ((ValueCell!11572 0))(
  ( (ValueCellFull!11572 (v!14906 V!37607)) (EmptyCell!11572) )
))
(declare-datatypes ((array!65192 0))(
  ( (array!65193 (arr!31385 (Array (_ BitVec 32) (_ BitVec 64))) (size!31911 (_ BitVec 32))) )
))
(declare-datatypes ((array!65194 0))(
  ( (array!65195 (arr!31386 (Array (_ BitVec 32) ValueCell!11572)) (size!31912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5738 0))(
  ( (LongMapFixedSize!5739 (defaultEntry!6247 Int) (mask!30124 (_ BitVec 32)) (extraKeys!5977 (_ BitVec 32)) (zeroValue!6081 V!37607) (minValue!6083 V!37607) (_size!2924 (_ BitVec 32)) (_keys!11432 array!65192) (_values!6270 array!65194) (_vacant!2924 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5738)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035176 (= res!691234 (validMask!0 (mask!30124 thiss!1427)))))

(declare-fun mapNonEmpty!38329 () Bool)

(declare-fun mapRes!38329 () Bool)

(declare-fun tp!73612 () Bool)

(declare-fun e!585289 () Bool)

(assert (=> mapNonEmpty!38329 (= mapRes!38329 (and tp!73612 e!585289))))

(declare-fun mapRest!38329 () (Array (_ BitVec 32) ValueCell!11572))

(declare-fun mapKey!38329 () (_ BitVec 32))

(declare-fun mapValue!38329 () ValueCell!11572)

(assert (=> mapNonEmpty!38329 (= (arr!31386 (_values!6270 thiss!1427)) (store mapRest!38329 mapKey!38329 mapValue!38329))))

(declare-fun b!1035177 () Bool)

(declare-fun tp_is_empty!24551 () Bool)

(assert (=> b!1035177 (= e!585289 tp_is_empty!24551)))

(declare-fun b!1035178 () Bool)

(declare-fun e!585291 () Bool)

(declare-fun e!585287 () Bool)

(assert (=> b!1035178 (= e!585291 (and e!585287 mapRes!38329))))

(declare-fun condMapEmpty!38329 () Bool)

(declare-fun mapDefault!38329 () ValueCell!11572)

