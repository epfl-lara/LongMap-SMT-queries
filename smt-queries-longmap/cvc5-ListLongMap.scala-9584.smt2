; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113366 () Bool)

(assert start!113366)

(declare-fun b_free!31417 () Bool)

(declare-fun b_next!31417 () Bool)

(assert (=> start!113366 (= b_free!31417 (not b_next!31417))))

(declare-fun tp!110056 () Bool)

(declare-fun b_and!50687 () Bool)

(assert (=> start!113366 (= tp!110056 b_and!50687)))

(declare-fun b!1345578 () Bool)

(declare-fun res!892843 () Bool)

(declare-fun e!765661 () Bool)

(assert (=> b!1345578 (=> (not res!892843) (not e!765661))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91674 0))(
  ( (array!91675 (arr!44293 (Array (_ BitVec 32) (_ BitVec 64))) (size!44843 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91674)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345578 (= res!892843 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44843 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57832 () Bool)

(declare-fun mapRes!57832 () Bool)

(declare-fun tp!110055 () Bool)

(declare-fun e!765660 () Bool)

(assert (=> mapNonEmpty!57832 (= mapRes!57832 (and tp!110055 e!765660))))

(declare-datatypes ((V!54993 0))(
  ( (V!54994 (val!18783 Int)) )
))
(declare-datatypes ((ValueCell!17810 0))(
  ( (ValueCellFull!17810 (v!21431 V!54993)) (EmptyCell!17810) )
))
(declare-fun mapRest!57832 () (Array (_ BitVec 32) ValueCell!17810))

(declare-fun mapValue!57832 () ValueCell!17810)

(declare-fun mapKey!57832 () (_ BitVec 32))

(declare-datatypes ((array!91676 0))(
  ( (array!91677 (arr!44294 (Array (_ BitVec 32) ValueCell!17810)) (size!44844 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91676)

(assert (=> mapNonEmpty!57832 (= (arr!44294 _values!1303) (store mapRest!57832 mapKey!57832 mapValue!57832))))

(declare-fun b!1345579 () Bool)

(declare-fun e!765663 () Bool)

(declare-fun e!765665 () Bool)

(assert (=> b!1345579 (= e!765663 (and e!765665 mapRes!57832))))

(declare-fun condMapEmpty!57832 () Bool)

(declare-fun mapDefault!57832 () ValueCell!17810)

