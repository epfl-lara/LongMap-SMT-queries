; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3852 () Bool)

(assert start!3852)

(declare-fun b_free!791 () Bool)

(declare-fun b_next!791 () Bool)

(assert (=> start!3852 (= b_free!791 (not b_next!791))))

(declare-fun tp!3786 () Bool)

(declare-fun b_and!1597 () Bool)

(assert (=> start!3852 (= tp!3786 b_and!1597)))

(declare-fun b!27041 () Bool)

(declare-fun res!16029 () Bool)

(declare-fun e!17632 () Bool)

(assert (=> b!27041 (=> (not res!16029) (not e!17632))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1351 0))(
  ( (V!1352 (val!599 Int)) )
))
(declare-datatypes ((ValueCell!373 0))(
  ( (ValueCellFull!373 (v!1686 V!1351)) (EmptyCell!373) )
))
(declare-datatypes ((array!1529 0))(
  ( (array!1530 (arr!720 (Array (_ BitVec 32) ValueCell!373)) (size!821 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1529)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1531 0))(
  ( (array!1532 (arr!721 (Array (_ BitVec 32) (_ BitVec 64))) (size!822 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1531)

(declare-fun zeroValue!1443 () V!1351)

(declare-fun minValue!1443 () V!1351)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((tuple2!1008 0))(
  ( (tuple2!1009 (_1!515 (_ BitVec 64)) (_2!515 V!1351)) )
))
(declare-datatypes ((List!608 0))(
  ( (Nil!605) (Cons!604 (h!1171 tuple2!1008) (t!3297 List!608)) )
))
(declare-datatypes ((ListLongMap!585 0))(
  ( (ListLongMap!586 (toList!308 List!608)) )
))
(declare-fun contains!246 (ListLongMap!585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!138 (array!1531 array!1529 (_ BitVec 32) (_ BitVec 32) V!1351 V!1351 (_ BitVec 32) Int) ListLongMap!585)

(assert (=> b!27041 (= res!16029 (not (contains!246 (getCurrentListMap!138 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27042 () Bool)

(declare-fun e!17629 () Bool)

(declare-fun tp_is_empty!1145 () Bool)

(assert (=> b!27042 (= e!17629 tp_is_empty!1145)))

(declare-fun b!27043 () Bool)

(declare-fun res!16030 () Bool)

(assert (=> b!27043 (=> (not res!16030) (not e!17632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1531 (_ BitVec 32)) Bool)

(assert (=> b!27043 (= res!16030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27044 () Bool)

(declare-fun e!17630 () Bool)

(assert (=> b!27044 (= e!17630 tp_is_empty!1145)))

(declare-fun mapIsEmpty!1240 () Bool)

(declare-fun mapRes!1240 () Bool)

(assert (=> mapIsEmpty!1240 mapRes!1240))

(declare-fun b!27046 () Bool)

(assert (=> b!27046 (= e!17632 (and (bvslt #b00000000000000000000000000000000 (size!822 _keys!1833)) (bvsge (size!822 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!27047 () Bool)

(declare-fun res!16031 () Bool)

(assert (=> b!27047 (=> (not res!16031) (not e!17632))))

(declare-datatypes ((List!609 0))(
  ( (Nil!606) (Cons!605 (h!1172 (_ BitVec 64)) (t!3298 List!609)) )
))
(declare-fun arrayNoDuplicates!0 (array!1531 (_ BitVec 32) List!609) Bool)

(assert (=> b!27047 (= res!16031 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!606))))

(declare-fun b!27048 () Bool)

(declare-fun e!17631 () Bool)

(assert (=> b!27048 (= e!17631 (and e!17630 mapRes!1240))))

(declare-fun condMapEmpty!1240 () Bool)

(declare-fun mapDefault!1240 () ValueCell!373)

