; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83250 () Bool)

(assert start!83250)

(declare-fun b_free!19243 () Bool)

(declare-fun b_next!19243 () Bool)

(assert (=> start!83250 (= b_free!19243 (not b_next!19243))))

(declare-fun tp!67007 () Bool)

(declare-fun b_and!30731 () Bool)

(assert (=> start!83250 (= tp!67007 b_and!30731)))

(declare-fun b!971449 () Bool)

(declare-fun res!650227 () Bool)

(declare-fun e!547622 () Bool)

(assert (=> b!971449 (=> (not res!650227) (not e!547622))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34505 0))(
  ( (V!34506 (val!11121 Int)) )
))
(declare-datatypes ((ValueCell!10589 0))(
  ( (ValueCellFull!10589 (v!13680 V!34505)) (EmptyCell!10589) )
))
(declare-datatypes ((array!60329 0))(
  ( (array!60330 (arr!29028 (Array (_ BitVec 32) ValueCell!10589)) (size!29507 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60329)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60331 0))(
  ( (array!60332 (arr!29029 (Array (_ BitVec 32) (_ BitVec 64))) (size!29508 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60331)

(assert (=> b!971449 (= res!650227 (and (= (size!29507 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29508 _keys!1717) (size!29507 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35221 () Bool)

(declare-fun mapRes!35221 () Bool)

(assert (=> mapIsEmpty!35221 mapRes!35221))

(declare-fun res!650228 () Bool)

(assert (=> start!83250 (=> (not res!650228) (not e!547622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83250 (= res!650228 (validMask!0 mask!2147))))

(assert (=> start!83250 e!547622))

(assert (=> start!83250 true))

(declare-fun e!547624 () Bool)

(declare-fun array_inv!22463 (array!60329) Bool)

(assert (=> start!83250 (and (array_inv!22463 _values!1425) e!547624)))

(declare-fun tp_is_empty!22141 () Bool)

(assert (=> start!83250 tp_is_empty!22141))

(assert (=> start!83250 tp!67007))

(declare-fun array_inv!22464 (array!60331) Bool)

(assert (=> start!83250 (array_inv!22464 _keys!1717)))

(declare-fun mapNonEmpty!35221 () Bool)

(declare-fun tp!67008 () Bool)

(declare-fun e!547620 () Bool)

(assert (=> mapNonEmpty!35221 (= mapRes!35221 (and tp!67008 e!547620))))

(declare-fun mapRest!35221 () (Array (_ BitVec 32) ValueCell!10589))

(declare-fun mapValue!35221 () ValueCell!10589)

(declare-fun mapKey!35221 () (_ BitVec 32))

(assert (=> mapNonEmpty!35221 (= (arr!29028 _values!1425) (store mapRest!35221 mapKey!35221 mapValue!35221))))

(declare-fun b!971450 () Bool)

(declare-fun res!650224 () Bool)

(assert (=> b!971450 (=> (not res!650224) (not e!547622))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971450 (= res!650224 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29508 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29508 _keys!1717))))))

(declare-fun b!971451 () Bool)

(declare-fun e!547623 () Bool)

(assert (=> b!971451 (= e!547624 (and e!547623 mapRes!35221))))

(declare-fun condMapEmpty!35221 () Bool)

(declare-fun mapDefault!35221 () ValueCell!10589)

