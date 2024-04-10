; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109208 () Bool)

(assert start!109208)

(declare-fun b_free!28697 () Bool)

(declare-fun b_next!28697 () Bool)

(assert (=> start!109208 (= b_free!28697 (not b_next!28697))))

(declare-fun tp!101209 () Bool)

(declare-fun b_and!46787 () Bool)

(assert (=> start!109208 (= tp!101209 b_and!46787)))

(declare-fun mapNonEmpty!53066 () Bool)

(declare-fun mapRes!53066 () Bool)

(declare-fun tp!101210 () Bool)

(declare-fun e!737401 () Bool)

(assert (=> mapNonEmpty!53066 (= mapRes!53066 (and tp!101210 e!737401))))

(declare-datatypes ((V!50885 0))(
  ( (V!50886 (val!17243 Int)) )
))
(declare-datatypes ((ValueCell!16270 0))(
  ( (ValueCellFull!16270 (v!19846 V!50885)) (EmptyCell!16270) )
))
(declare-fun mapValue!53066 () ValueCell!16270)

(declare-fun mapKey!53066 () (_ BitVec 32))

(declare-datatypes ((array!85710 0))(
  ( (array!85711 (arr!41356 (Array (_ BitVec 32) ValueCell!16270)) (size!41906 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85710)

(declare-fun mapRest!53066 () (Array (_ BitVec 32) ValueCell!16270))

(assert (=> mapNonEmpty!53066 (= (arr!41356 _values!1445) (store mapRest!53066 mapKey!53066 mapValue!53066))))

(declare-fun b!1291822 () Bool)

(declare-fun res!858305 () Bool)

(declare-fun e!737404 () Bool)

(assert (=> b!1291822 (=> (not res!858305) (not e!737404))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85712 0))(
  ( (array!85713 (arr!41357 (Array (_ BitVec 32) (_ BitVec 64))) (size!41907 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85712)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291822 (= res!858305 (and (= (size!41906 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41907 _keys!1741) (size!41906 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53066 () Bool)

(assert (=> mapIsEmpty!53066 mapRes!53066))

(declare-fun b!1291823 () Bool)

(declare-fun res!858306 () Bool)

(assert (=> b!1291823 (=> (not res!858306) (not e!737404))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1291823 (= res!858306 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41907 _keys!1741))))))

(declare-fun b!1291824 () Bool)

(declare-fun res!858307 () Bool)

(assert (=> b!1291824 (=> (not res!858307) (not e!737404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85712 (_ BitVec 32)) Bool)

(assert (=> b!1291824 (= res!858307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858309 () Bool)

(assert (=> start!109208 (=> (not res!858309) (not e!737404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109208 (= res!858309 (validMask!0 mask!2175))))

(assert (=> start!109208 e!737404))

(declare-fun tp_is_empty!34337 () Bool)

(assert (=> start!109208 tp_is_empty!34337))

(assert (=> start!109208 true))

(declare-fun e!737403 () Bool)

(declare-fun array_inv!31335 (array!85710) Bool)

(assert (=> start!109208 (and (array_inv!31335 _values!1445) e!737403)))

(declare-fun array_inv!31336 (array!85712) Bool)

(assert (=> start!109208 (array_inv!31336 _keys!1741)))

(assert (=> start!109208 tp!101209))

(declare-fun b!1291821 () Bool)

(declare-fun e!737405 () Bool)

(assert (=> b!1291821 (= e!737403 (and e!737405 mapRes!53066))))

(declare-fun condMapEmpty!53066 () Bool)

(declare-fun mapDefault!53066 () ValueCell!16270)

