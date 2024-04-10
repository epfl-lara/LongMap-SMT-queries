; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83350 () Bool)

(assert start!83350)

(declare-fun b_free!19343 () Bool)

(declare-fun b_next!19343 () Bool)

(assert (=> start!83350 (= b_free!19343 (not b_next!19343))))

(declare-fun tp!67308 () Bool)

(declare-fun b_and!30907 () Bool)

(assert (=> start!83350 (= tp!67308 b_and!30907)))

(declare-fun b!973141 () Bool)

(declare-fun res!651396 () Bool)

(declare-fun e!548513 () Bool)

(assert (=> b!973141 (=> (not res!651396) (not e!548513))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34637 0))(
  ( (V!34638 (val!11171 Int)) )
))
(declare-datatypes ((ValueCell!10639 0))(
  ( (ValueCellFull!10639 (v!13730 V!34637)) (EmptyCell!10639) )
))
(declare-datatypes ((array!60523 0))(
  ( (array!60524 (arr!29125 (Array (_ BitVec 32) ValueCell!10639)) (size!29604 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60523)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60525 0))(
  ( (array!60526 (arr!29126 (Array (_ BitVec 32) (_ BitVec 64))) (size!29605 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60525)

(assert (=> b!973141 (= res!651396 (and (= (size!29604 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29605 _keys!1717) (size!29604 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973142 () Bool)

(declare-fun res!651392 () Bool)

(assert (=> b!973142 (=> (not res!651392) (not e!548513))))

(declare-datatypes ((List!20197 0))(
  ( (Nil!20194) (Cons!20193 (h!21355 (_ BitVec 64)) (t!28638 List!20197)) )
))
(declare-fun arrayNoDuplicates!0 (array!60525 (_ BitVec 32) List!20197) Bool)

(assert (=> b!973142 (= res!651392 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20194))))

(declare-fun b!973143 () Bool)

(declare-fun e!548515 () Bool)

(assert (=> b!973143 (= e!548513 e!548515)))

(declare-fun res!651389 () Bool)

(assert (=> b!973143 (=> (not res!651389) (not e!548515))))

(declare-datatypes ((tuple2!14336 0))(
  ( (tuple2!14337 (_1!7179 (_ BitVec 64)) (_2!7179 V!34637)) )
))
(declare-datatypes ((List!20198 0))(
  ( (Nil!20195) (Cons!20194 (h!21356 tuple2!14336) (t!28639 List!20198)) )
))
(declare-datatypes ((ListLongMap!13033 0))(
  ( (ListLongMap!13034 (toList!6532 List!20198)) )
))
(declare-fun lt!432321 () ListLongMap!13033)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5625 (ListLongMap!13033 (_ BitVec 64)) Bool)

(assert (=> b!973143 (= res!651389 (contains!5625 lt!432321 (select (arr!29126 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34637)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34637)

(declare-fun getCurrentListMap!3765 (array!60525 array!60523 (_ BitVec 32) (_ BitVec 32) V!34637 V!34637 (_ BitVec 32) Int) ListLongMap!13033)

(assert (=> b!973143 (= lt!432321 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973144 () Bool)

(declare-fun e!548518 () Bool)

(assert (=> b!973144 (= e!548515 e!548518)))

(declare-fun res!651390 () Bool)

(assert (=> b!973144 (=> (not res!651390) (not e!548518))))

(declare-fun lt!432320 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973144 (= res!651390 (validKeyInArray!0 lt!432320))))

(assert (=> b!973144 (= lt!432320 (select (arr!29126 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!432325 () ListLongMap!13033)

(assert (=> b!973144 (= lt!432325 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35371 () Bool)

(declare-fun mapRes!35371 () Bool)

(declare-fun tp!67307 () Bool)

(declare-fun e!548517 () Bool)

(assert (=> mapNonEmpty!35371 (= mapRes!35371 (and tp!67307 e!548517))))

(declare-fun mapValue!35371 () ValueCell!10639)

(declare-fun mapRest!35371 () (Array (_ BitVec 32) ValueCell!10639))

(declare-fun mapKey!35371 () (_ BitVec 32))

(assert (=> mapNonEmpty!35371 (= (arr!29125 _values!1425) (store mapRest!35371 mapKey!35371 mapValue!35371))))

(declare-fun b!973146 () Bool)

(assert (=> b!973146 (= e!548518 (not true))))

(declare-fun lt!432324 () tuple2!14336)

(declare-fun +!2901 (ListLongMap!13033 tuple2!14336) ListLongMap!13033)

(assert (=> b!973146 (contains!5625 (+!2901 lt!432321 lt!432324) (select (arr!29126 _keys!1717) i!822))))

(declare-fun lt!432326 () V!34637)

(declare-datatypes ((Unit!32423 0))(
  ( (Unit!32424) )
))
(declare-fun lt!432322 () Unit!32423)

(declare-fun addStillContains!597 (ListLongMap!13033 (_ BitVec 64) V!34637 (_ BitVec 64)) Unit!32423)

(assert (=> b!973146 (= lt!432322 (addStillContains!597 lt!432321 lt!432320 lt!432326 (select (arr!29126 _keys!1717) i!822)))))

(assert (=> b!973146 (= lt!432325 (+!2901 (getCurrentListMap!3765 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432324))))

(assert (=> b!973146 (= lt!432324 (tuple2!14337 lt!432320 lt!432326))))

(declare-fun get!15094 (ValueCell!10639 V!34637) V!34637)

(declare-fun dynLambda!1690 (Int (_ BitVec 64)) V!34637)

(assert (=> b!973146 (= lt!432326 (get!15094 (select (arr!29125 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1690 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432323 () Unit!32423)

(declare-fun lemmaListMapRecursiveValidKeyArray!267 (array!60525 array!60523 (_ BitVec 32) (_ BitVec 32) V!34637 V!34637 (_ BitVec 32) Int) Unit!32423)

(assert (=> b!973146 (= lt!432323 (lemmaListMapRecursiveValidKeyArray!267 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973147 () Bool)

(declare-fun res!651393 () Bool)

(assert (=> b!973147 (=> (not res!651393) (not e!548513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60525 (_ BitVec 32)) Bool)

(assert (=> b!973147 (= res!651393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973148 () Bool)

(declare-fun tp_is_empty!22241 () Bool)

(assert (=> b!973148 (= e!548517 tp_is_empty!22241)))

(declare-fun b!973149 () Bool)

(declare-fun res!651391 () Bool)

(assert (=> b!973149 (=> (not res!651391) (not e!548513))))

(assert (=> b!973149 (= res!651391 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29605 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29605 _keys!1717))))))

(declare-fun b!973150 () Bool)

(declare-fun e!548516 () Bool)

(assert (=> b!973150 (= e!548516 tp_is_empty!22241)))

(declare-fun mapIsEmpty!35371 () Bool)

(assert (=> mapIsEmpty!35371 mapRes!35371))

(declare-fun b!973151 () Bool)

(declare-fun e!548514 () Bool)

(assert (=> b!973151 (= e!548514 (and e!548516 mapRes!35371))))

(declare-fun condMapEmpty!35371 () Bool)

(declare-fun mapDefault!35371 () ValueCell!10639)

