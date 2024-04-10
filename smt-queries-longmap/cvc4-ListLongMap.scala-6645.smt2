; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83846 () Bool)

(assert start!83846)

(declare-fun b_free!19655 () Bool)

(declare-fun b_next!19655 () Bool)

(assert (=> start!83846 (= b_free!19655 (not b_next!19655))))

(declare-fun tp!68406 () Bool)

(declare-fun b_and!31399 () Bool)

(assert (=> start!83846 (= tp!68406 b_and!31399)))

(declare-fun b!979506 () Bool)

(declare-fun res!655515 () Bool)

(declare-fun e!552148 () Bool)

(assert (=> b!979506 (=> (not res!655515) (not e!552148))))

(declare-datatypes ((array!61315 0))(
  ( (array!61316 (arr!29515 (Array (_ BitVec 32) (_ BitVec 64))) (size!29994 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61315)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979506 (= res!655515 (validKeyInArray!0 (select (arr!29515 _keys!1544) from!1932)))))

(declare-fun b!979507 () Bool)

(declare-fun res!655510 () Bool)

(assert (=> b!979507 (=> (not res!655510) (not e!552148))))

(assert (=> b!979507 (= res!655510 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29994 _keys!1544))))))

(declare-fun res!655514 () Bool)

(assert (=> start!83846 (=> (not res!655514) (not e!552148))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83846 (= res!655514 (validMask!0 mask!1948))))

(assert (=> start!83846 e!552148))

(assert (=> start!83846 true))

(declare-fun tp_is_empty!22649 () Bool)

(assert (=> start!83846 tp_is_empty!22649))

(declare-datatypes ((V!35181 0))(
  ( (V!35182 (val!11375 Int)) )
))
(declare-datatypes ((ValueCell!10843 0))(
  ( (ValueCellFull!10843 (v!13937 V!35181)) (EmptyCell!10843) )
))
(declare-datatypes ((array!61317 0))(
  ( (array!61318 (arr!29516 (Array (_ BitVec 32) ValueCell!10843)) (size!29995 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61317)

(declare-fun e!552147 () Bool)

(declare-fun array_inv!22819 (array!61317) Bool)

(assert (=> start!83846 (and (array_inv!22819 _values!1278) e!552147)))

(assert (=> start!83846 tp!68406))

(declare-fun array_inv!22820 (array!61315) Bool)

(assert (=> start!83846 (array_inv!22820 _keys!1544)))

(declare-fun mapNonEmpty!36002 () Bool)

(declare-fun mapRes!36002 () Bool)

(declare-fun tp!68407 () Bool)

(declare-fun e!552149 () Bool)

(assert (=> mapNonEmpty!36002 (= mapRes!36002 (and tp!68407 e!552149))))

(declare-fun mapKey!36002 () (_ BitVec 32))

(declare-fun mapValue!36002 () ValueCell!10843)

(declare-fun mapRest!36002 () (Array (_ BitVec 32) ValueCell!10843))

(assert (=> mapNonEmpty!36002 (= (arr!29516 _values!1278) (store mapRest!36002 mapKey!36002 mapValue!36002))))

(declare-fun b!979508 () Bool)

(declare-fun e!552150 () Bool)

(assert (=> b!979508 (= e!552147 (and e!552150 mapRes!36002))))

(declare-fun condMapEmpty!36002 () Bool)

(declare-fun mapDefault!36002 () ValueCell!10843)

