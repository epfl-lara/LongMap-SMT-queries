; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3910 () Bool)

(assert start!3910)

(declare-fun b_free!815 () Bool)

(declare-fun b_next!815 () Bool)

(assert (=> start!3910 (= b_free!815 (not b_next!815))))

(declare-fun tp!3865 () Bool)

(declare-fun b_and!1625 () Bool)

(assert (=> start!3910 (= tp!3865 b_and!1625)))

(declare-fun b!27606 () Bool)

(declare-fun res!16357 () Bool)

(declare-fun e!17963 () Bool)

(assert (=> b!27606 (=> (not res!16357) (not e!17963))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27606 (= res!16357 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1282 () Bool)

(declare-fun mapRes!1282 () Bool)

(declare-fun tp!3864 () Bool)

(declare-fun e!17960 () Bool)

(assert (=> mapNonEmpty!1282 (= mapRes!1282 (and tp!3864 e!17960))))

(declare-datatypes ((V!1383 0))(
  ( (V!1384 (val!611 Int)) )
))
(declare-datatypes ((ValueCell!385 0))(
  ( (ValueCellFull!385 (v!1700 V!1383)) (EmptyCell!385) )
))
(declare-fun mapValue!1282 () ValueCell!385)

(declare-datatypes ((array!1579 0))(
  ( (array!1580 (arr!743 (Array (_ BitVec 32) ValueCell!385)) (size!844 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1579)

(declare-fun mapRest!1282 () (Array (_ BitVec 32) ValueCell!385))

(declare-fun mapKey!1282 () (_ BitVec 32))

(assert (=> mapNonEmpty!1282 (= (arr!743 _values!1501) (store mapRest!1282 mapKey!1282 mapValue!1282))))

(declare-fun b!27607 () Bool)

(assert (=> b!27607 (= e!17963 false)))

(declare-fun lt!10697 () (_ BitVec 32))

(declare-datatypes ((array!1581 0))(
  ( (array!1582 (arr!744 (Array (_ BitVec 32) (_ BitVec 64))) (size!845 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1581)

(declare-fun arrayScanForKey!0 (array!1581 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27607 (= lt!10697 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1282 () Bool)

(assert (=> mapIsEmpty!1282 mapRes!1282))

(declare-fun b!27608 () Bool)

(declare-fun tp_is_empty!1169 () Bool)

(assert (=> b!27608 (= e!17960 tp_is_empty!1169)))

(declare-fun b!27609 () Bool)

(declare-fun res!16362 () Bool)

(assert (=> b!27609 (=> (not res!16362) (not e!17963))))

(declare-datatypes ((List!627 0))(
  ( (Nil!624) (Cons!623 (h!1190 (_ BitVec 64)) (t!3320 List!627)) )
))
(declare-fun arrayNoDuplicates!0 (array!1581 (_ BitVec 32) List!627) Bool)

(assert (=> b!27609 (= res!16362 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!624))))

(declare-fun b!27610 () Bool)

(declare-fun res!16361 () Bool)

(assert (=> b!27610 (=> (not res!16361) (not e!17963))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1581 (_ BitVec 32)) Bool)

(assert (=> b!27610 (= res!16361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27611 () Bool)

(declare-fun res!16359 () Bool)

(assert (=> b!27611 (=> (not res!16359) (not e!17963))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27611 (= res!16359 (and (= (size!844 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!845 _keys!1833) (size!844 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27612 () Bool)

(declare-fun res!16358 () Bool)

(assert (=> b!27612 (=> (not res!16358) (not e!17963))))

(declare-fun arrayContainsKey!0 (array!1581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27612 (= res!16358 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27613 () Bool)

(declare-fun e!17961 () Bool)

(declare-fun e!17962 () Bool)

(assert (=> b!27613 (= e!17961 (and e!17962 mapRes!1282))))

(declare-fun condMapEmpty!1282 () Bool)

(declare-fun mapDefault!1282 () ValueCell!385)

