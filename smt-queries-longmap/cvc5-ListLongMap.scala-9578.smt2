; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113330 () Bool)

(assert start!113330)

(declare-fun b_free!31381 () Bool)

(declare-fun b_next!31381 () Bool)

(assert (=> start!113330 (= b_free!31381 (not b_next!31381))))

(declare-fun tp!109948 () Bool)

(declare-fun b_and!50615 () Bool)

(assert (=> start!113330 (= tp!109948 b_and!50615)))

(declare-fun b!1344786 () Bool)

(declare-fun res!892249 () Bool)

(declare-fun e!765339 () Bool)

(assert (=> b!1344786 (=> (not res!892249) (not e!765339))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91602 0))(
  ( (array!91603 (arr!44257 (Array (_ BitVec 32) (_ BitVec 64))) (size!44807 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91602)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344786 (= res!892249 (not (= k!1142 (select (arr!44257 _keys!1571) from!1960))))))

(declare-fun b!1344787 () Bool)

(declare-fun res!892254 () Bool)

(declare-fun e!765341 () Bool)

(assert (=> b!1344787 (=> (not res!892254) (not e!765341))))

(assert (=> b!1344787 (= res!892254 (not (= (select (arr!44257 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1344788 () Bool)

(declare-fun res!892256 () Bool)

(assert (=> b!1344788 (=> (not res!892256) (not e!765341))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91602 (_ BitVec 32)) Bool)

(assert (=> b!1344788 (= res!892256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344789 () Bool)

(declare-fun e!765340 () Bool)

(declare-fun tp_is_empty!37381 () Bool)

(assert (=> b!1344789 (= e!765340 tp_is_empty!37381)))

(declare-fun b!1344790 () Bool)

(declare-fun res!892248 () Bool)

(assert (=> b!1344790 (=> (not res!892248) (not e!765341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344790 (= res!892248 (validKeyInArray!0 (select (arr!44257 _keys!1571) from!1960)))))

(declare-fun res!892252 () Bool)

(assert (=> start!113330 (=> (not res!892252) (not e!765341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113330 (= res!892252 (validMask!0 mask!1977))))

(assert (=> start!113330 e!765341))

(assert (=> start!113330 tp_is_empty!37381))

(assert (=> start!113330 true))

(declare-fun array_inv!33355 (array!91602) Bool)

(assert (=> start!113330 (array_inv!33355 _keys!1571)))

(declare-datatypes ((V!54945 0))(
  ( (V!54946 (val!18765 Int)) )
))
(declare-datatypes ((ValueCell!17792 0))(
  ( (ValueCellFull!17792 (v!21413 V!54945)) (EmptyCell!17792) )
))
(declare-datatypes ((array!91604 0))(
  ( (array!91605 (arr!44258 (Array (_ BitVec 32) ValueCell!17792)) (size!44808 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91604)

(declare-fun e!765338 () Bool)

(declare-fun array_inv!33356 (array!91604) Bool)

(assert (=> start!113330 (and (array_inv!33356 _values!1303) e!765338)))

(assert (=> start!113330 tp!109948))

(declare-fun b!1344791 () Bool)

(declare-fun res!892255 () Bool)

(assert (=> b!1344791 (=> (not res!892255) (not e!765341))))

(declare-datatypes ((List!31342 0))(
  ( (Nil!31339) (Cons!31338 (h!32547 (_ BitVec 64)) (t!45880 List!31342)) )
))
(declare-fun arrayNoDuplicates!0 (array!91602 (_ BitVec 32) List!31342) Bool)

(assert (=> b!1344791 (= res!892255 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31339))))

(declare-fun b!1344792 () Bool)

(declare-fun res!892251 () Bool)

(assert (=> b!1344792 (=> (not res!892251) (not e!765341))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344792 (= res!892251 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44807 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344793 () Bool)

(declare-fun res!892253 () Bool)

(assert (=> b!1344793 (=> (not res!892253) (not e!765341))))

(assert (=> b!1344793 (= res!892253 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!57778 () Bool)

(declare-fun mapRes!57778 () Bool)

(assert (=> mapIsEmpty!57778 mapRes!57778))

(declare-fun b!1344794 () Bool)

(declare-fun e!765336 () Bool)

(assert (=> b!1344794 (= e!765338 (and e!765336 mapRes!57778))))

(declare-fun condMapEmpty!57778 () Bool)

(declare-fun mapDefault!57778 () ValueCell!17792)

