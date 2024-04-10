; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37038 () Bool)

(assert start!37038)

(declare-fun b_free!8165 () Bool)

(declare-fun b_next!8165 () Bool)

(assert (=> start!37038 (= b_free!8165 (not b_next!8165))))

(declare-fun tp!29211 () Bool)

(declare-fun b_and!15407 () Bool)

(assert (=> start!37038 (= tp!29211 b_and!15407)))

(declare-fun mapIsEmpty!14784 () Bool)

(declare-fun mapRes!14784 () Bool)

(assert (=> mapIsEmpty!14784 mapRes!14784))

(declare-fun b!372257 () Bool)

(declare-fun e!227099 () Bool)

(declare-fun e!227094 () Bool)

(assert (=> b!372257 (= e!227099 e!227094)))

(declare-fun res!209427 () Bool)

(assert (=> b!372257 (=> (not res!209427) (not e!227094))))

(declare-datatypes ((array!21567 0))(
  ( (array!21568 (arr!10252 (Array (_ BitVec 32) (_ BitVec 64))) (size!10604 (_ BitVec 32))) )
))
(declare-fun lt!170657 () array!21567)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21567 (_ BitVec 32)) Bool)

(assert (=> b!372257 (= res!209427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170657 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21567)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372257 (= lt!170657 (array!21568 (store (arr!10252 _keys!658) i!548 k!778) (size!10604 _keys!658)))))

(declare-fun b!372258 () Bool)

(declare-fun e!227096 () Bool)

(declare-fun tp_is_empty!8813 () Bool)

(assert (=> b!372258 (= e!227096 tp_is_empty!8813)))

(declare-fun b!372259 () Bool)

(declare-fun res!209423 () Bool)

(assert (=> b!372259 (=> (not res!209423) (not e!227099))))

(assert (=> b!372259 (= res!209423 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10604 _keys!658))))))

(declare-fun res!209422 () Bool)

(assert (=> start!37038 (=> (not res!209422) (not e!227099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37038 (= res!209422 (validMask!0 mask!970))))

(assert (=> start!37038 e!227099))

(declare-datatypes ((V!12855 0))(
  ( (V!12856 (val!4451 Int)) )
))
(declare-datatypes ((ValueCell!4063 0))(
  ( (ValueCellFull!4063 (v!6648 V!12855)) (EmptyCell!4063) )
))
(declare-datatypes ((array!21569 0))(
  ( (array!21570 (arr!10253 (Array (_ BitVec 32) ValueCell!4063)) (size!10605 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21569)

(declare-fun e!227097 () Bool)

(declare-fun array_inv!7564 (array!21569) Bool)

(assert (=> start!37038 (and (array_inv!7564 _values!506) e!227097)))

(assert (=> start!37038 tp!29211))

(assert (=> start!37038 true))

(assert (=> start!37038 tp_is_empty!8813))

(declare-fun array_inv!7565 (array!21567) Bool)

(assert (=> start!37038 (array_inv!7565 _keys!658)))

(declare-fun b!372260 () Bool)

(declare-fun res!209426 () Bool)

(assert (=> b!372260 (=> (not res!209426) (not e!227099))))

(declare-fun arrayContainsKey!0 (array!21567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372260 (= res!209426 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!372261 () Bool)

(declare-fun res!209425 () Bool)

(assert (=> b!372261 (=> (not res!209425) (not e!227099))))

(assert (=> b!372261 (= res!209425 (or (= (select (arr!10252 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10252 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372262 () Bool)

(declare-fun res!209429 () Bool)

(assert (=> b!372262 (=> (not res!209429) (not e!227099))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372262 (= res!209429 (and (= (size!10605 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10604 _keys!658) (size!10605 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14784 () Bool)

(declare-fun tp!29210 () Bool)

(assert (=> mapNonEmpty!14784 (= mapRes!14784 (and tp!29210 e!227096))))

(declare-fun mapKey!14784 () (_ BitVec 32))

(declare-fun mapRest!14784 () (Array (_ BitVec 32) ValueCell!4063))

(declare-fun mapValue!14784 () ValueCell!4063)

(assert (=> mapNonEmpty!14784 (= (arr!10253 _values!506) (store mapRest!14784 mapKey!14784 mapValue!14784))))

(declare-fun b!372263 () Bool)

(declare-fun res!209424 () Bool)

(assert (=> b!372263 (=> (not res!209424) (not e!227099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372263 (= res!209424 (validKeyInArray!0 k!778))))

(declare-fun b!372264 () Bool)

(declare-fun e!227095 () Bool)

(assert (=> b!372264 (= e!227097 (and e!227095 mapRes!14784))))

(declare-fun condMapEmpty!14784 () Bool)

(declare-fun mapDefault!14784 () ValueCell!4063)

