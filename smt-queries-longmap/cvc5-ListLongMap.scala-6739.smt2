; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84442 () Bool)

(assert start!84442)

(declare-fun b_free!19993 () Bool)

(declare-fun b_next!19993 () Bool)

(assert (=> start!84442 (= b_free!19993 (not b_next!19993))))

(declare-fun tp!69759 () Bool)

(declare-fun b_and!32053 () Bool)

(assert (=> start!84442 (= tp!69759 b_and!32053)))

(declare-fun b!987595 () Bool)

(declare-fun res!660677 () Bool)

(declare-fun e!556889 () Bool)

(assert (=> b!987595 (=> (not res!660677) (not e!556889))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987595 (= res!660677 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!660676 () Bool)

(assert (=> start!84442 (=> (not res!660676) (not e!556889))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84442 (= res!660676 (validMask!0 mask!1948))))

(assert (=> start!84442 e!556889))

(assert (=> start!84442 true))

(declare-fun tp_is_empty!23209 () Bool)

(assert (=> start!84442 tp_is_empty!23209))

(declare-datatypes ((V!35929 0))(
  ( (V!35930 (val!11655 Int)) )
))
(declare-datatypes ((ValueCell!11123 0))(
  ( (ValueCellFull!11123 (v!14219 V!35929)) (EmptyCell!11123) )
))
(declare-datatypes ((array!62377 0))(
  ( (array!62378 (arr!30044 (Array (_ BitVec 32) ValueCell!11123)) (size!30523 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62377)

(declare-fun e!556892 () Bool)

(declare-fun array_inv!23213 (array!62377) Bool)

(assert (=> start!84442 (and (array_inv!23213 _values!1278) e!556892)))

(assert (=> start!84442 tp!69759))

(declare-datatypes ((array!62379 0))(
  ( (array!62380 (arr!30045 (Array (_ BitVec 32) (_ BitVec 64))) (size!30524 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62379)

(declare-fun array_inv!23214 (array!62379) Bool)

(assert (=> start!84442 (array_inv!23214 _keys!1544)))

(declare-fun b!987596 () Bool)

(declare-fun e!556890 () Bool)

(assert (=> b!987596 (= e!556890 tp_is_empty!23209)))

(declare-fun b!987597 () Bool)

(declare-fun res!660680 () Bool)

(assert (=> b!987597 (=> (not res!660680) (not e!556889))))

(declare-datatypes ((List!20778 0))(
  ( (Nil!20775) (Cons!20774 (h!21936 (_ BitVec 64)) (t!29699 List!20778)) )
))
(declare-fun arrayNoDuplicates!0 (array!62379 (_ BitVec 32) List!20778) Bool)

(assert (=> b!987597 (= res!660680 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20775))))

(declare-fun mapIsEmpty!36848 () Bool)

(declare-fun mapRes!36848 () Bool)

(assert (=> mapIsEmpty!36848 mapRes!36848))

(declare-fun b!987598 () Bool)

(declare-fun res!660678 () Bool)

(assert (=> b!987598 (=> (not res!660678) (not e!556889))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987598 (= res!660678 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30524 _keys!1544))))))

(declare-fun mapNonEmpty!36848 () Bool)

(declare-fun tp!69760 () Bool)

(assert (=> mapNonEmpty!36848 (= mapRes!36848 (and tp!69760 e!556890))))

(declare-fun mapValue!36848 () ValueCell!11123)

(declare-fun mapKey!36848 () (_ BitVec 32))

(declare-fun mapRest!36848 () (Array (_ BitVec 32) ValueCell!11123))

(assert (=> mapNonEmpty!36848 (= (arr!30044 _values!1278) (store mapRest!36848 mapKey!36848 mapValue!36848))))

(declare-fun b!987599 () Bool)

(declare-fun e!556891 () Bool)

(assert (=> b!987599 (= e!556892 (and e!556891 mapRes!36848))))

(declare-fun condMapEmpty!36848 () Bool)

(declare-fun mapDefault!36848 () ValueCell!11123)

