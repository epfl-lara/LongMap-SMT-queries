; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83190 () Bool)

(assert start!83190)

(declare-fun b_free!19183 () Bool)

(declare-fun b_next!19183 () Bool)

(assert (=> start!83190 (= b_free!19183 (not b_next!19183))))

(declare-fun tp!66828 () Bool)

(declare-fun b_and!30671 () Bool)

(assert (=> start!83190 (= tp!66828 b_and!30671)))

(declare-fun b!970574 () Bool)

(declare-fun e!547174 () Bool)

(assert (=> b!970574 (= e!547174 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34425 0))(
  ( (V!34426 (val!11091 Int)) )
))
(declare-datatypes ((ValueCell!10559 0))(
  ( (ValueCellFull!10559 (v!13650 V!34425)) (EmptyCell!10559) )
))
(declare-datatypes ((array!60217 0))(
  ( (array!60218 (arr!28972 (Array (_ BitVec 32) ValueCell!10559)) (size!29451 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60217)

(declare-fun zeroValue!1367 () V!34425)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431753 () Bool)

(declare-fun minValue!1367 () V!34425)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60219 0))(
  ( (array!60220 (arr!28973 (Array (_ BitVec 32) (_ BitVec 64))) (size!29452 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60219)

(declare-datatypes ((tuple2!14212 0))(
  ( (tuple2!14213 (_1!7117 (_ BitVec 64)) (_2!7117 V!34425)) )
))
(declare-datatypes ((List!20081 0))(
  ( (Nil!20078) (Cons!20077 (h!21239 tuple2!14212) (t!28444 List!20081)) )
))
(declare-datatypes ((ListLongMap!12909 0))(
  ( (ListLongMap!12910 (toList!6470 List!20081)) )
))
(declare-fun contains!5574 (ListLongMap!12909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3703 (array!60219 array!60217 (_ BitVec 32) (_ BitVec 32) V!34425 V!34425 (_ BitVec 32) Int) ListLongMap!12909)

(assert (=> b!970574 (= lt!431753 (contains!5574 (getCurrentListMap!3703 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28973 _keys!1717) i!822)))))

(declare-fun b!970575 () Bool)

(declare-fun res!649619 () Bool)

(assert (=> b!970575 (=> (not res!649619) (not e!547174))))

(assert (=> b!970575 (= res!649619 (and (= (size!29451 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29452 _keys!1717) (size!29451 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970576 () Bool)

(declare-fun res!649618 () Bool)

(assert (=> b!970576 (=> (not res!649618) (not e!547174))))

(declare-datatypes ((List!20082 0))(
  ( (Nil!20079) (Cons!20078 (h!21240 (_ BitVec 64)) (t!28445 List!20082)) )
))
(declare-fun arrayNoDuplicates!0 (array!60219 (_ BitVec 32) List!20082) Bool)

(assert (=> b!970576 (= res!649618 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20079))))

(declare-fun res!649622 () Bool)

(assert (=> start!83190 (=> (not res!649622) (not e!547174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83190 (= res!649622 (validMask!0 mask!2147))))

(assert (=> start!83190 e!547174))

(assert (=> start!83190 true))

(declare-fun e!547172 () Bool)

(declare-fun array_inv!22425 (array!60217) Bool)

(assert (=> start!83190 (and (array_inv!22425 _values!1425) e!547172)))

(declare-fun tp_is_empty!22081 () Bool)

(assert (=> start!83190 tp_is_empty!22081))

(assert (=> start!83190 tp!66828))

(declare-fun array_inv!22426 (array!60219) Bool)

(assert (=> start!83190 (array_inv!22426 _keys!1717)))

(declare-fun mapNonEmpty!35131 () Bool)

(declare-fun mapRes!35131 () Bool)

(declare-fun tp!66827 () Bool)

(declare-fun e!547170 () Bool)

(assert (=> mapNonEmpty!35131 (= mapRes!35131 (and tp!66827 e!547170))))

(declare-fun mapKey!35131 () (_ BitVec 32))

(declare-fun mapValue!35131 () ValueCell!10559)

(declare-fun mapRest!35131 () (Array (_ BitVec 32) ValueCell!10559))

(assert (=> mapNonEmpty!35131 (= (arr!28972 _values!1425) (store mapRest!35131 mapKey!35131 mapValue!35131))))

(declare-fun b!970577 () Bool)

(declare-fun res!649621 () Bool)

(assert (=> b!970577 (=> (not res!649621) (not e!547174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970577 (= res!649621 (validKeyInArray!0 (select (arr!28973 _keys!1717) i!822)))))

(declare-fun b!970578 () Bool)

(assert (=> b!970578 (= e!547170 tp_is_empty!22081)))

(declare-fun b!970579 () Bool)

(declare-fun res!649620 () Bool)

(assert (=> b!970579 (=> (not res!649620) (not e!547174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60219 (_ BitVec 32)) Bool)

(assert (=> b!970579 (= res!649620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970580 () Bool)

(declare-fun res!649623 () Bool)

(assert (=> b!970580 (=> (not res!649623) (not e!547174))))

(assert (=> b!970580 (= res!649623 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29452 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29452 _keys!1717))))))

(declare-fun b!970581 () Bool)

(declare-fun e!547173 () Bool)

(assert (=> b!970581 (= e!547172 (and e!547173 mapRes!35131))))

(declare-fun condMapEmpty!35131 () Bool)

(declare-fun mapDefault!35131 () ValueCell!10559)

