; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84304 () Bool)

(assert start!84304)

(declare-fun b!986215 () Bool)

(declare-fun e!556013 () Bool)

(declare-fun tp_is_empty!23107 () Bool)

(assert (=> b!986215 (= e!556013 tp_is_empty!23107)))

(declare-fun b!986216 () Bool)

(declare-fun e!556015 () Bool)

(assert (=> b!986216 (= e!556015 tp_is_empty!23107)))

(declare-fun mapNonEmpty!36689 () Bool)

(declare-fun mapRes!36689 () Bool)

(declare-fun tp!69544 () Bool)

(assert (=> mapNonEmpty!36689 (= mapRes!36689 (and tp!69544 e!556013))))

(declare-datatypes ((V!35793 0))(
  ( (V!35794 (val!11604 Int)) )
))
(declare-datatypes ((ValueCell!11072 0))(
  ( (ValueCellFull!11072 (v!14166 V!35793)) (EmptyCell!11072) )
))
(declare-datatypes ((array!62181 0))(
  ( (array!62182 (arr!29948 (Array (_ BitVec 32) ValueCell!11072)) (size!30427 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62181)

(declare-fun mapValue!36689 () ValueCell!11072)

(declare-fun mapRest!36689 () (Array (_ BitVec 32) ValueCell!11072))

(declare-fun mapKey!36689 () (_ BitVec 32))

(assert (=> mapNonEmpty!36689 (= (arr!29948 _values!1278) (store mapRest!36689 mapKey!36689 mapValue!36689))))

(declare-fun b!986217 () Bool)

(declare-fun res!659868 () Bool)

(declare-fun e!556016 () Bool)

(assert (=> b!986217 (=> (not res!659868) (not e!556016))))

(declare-datatypes ((array!62183 0))(
  ( (array!62184 (arr!29949 (Array (_ BitVec 32) (_ BitVec 64))) (size!30428 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62183)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986217 (= res!659868 (validKeyInArray!0 (select (arr!29949 _keys!1544) from!1932)))))

(declare-fun b!986218 () Bool)

(declare-fun res!659873 () Bool)

(assert (=> b!986218 (=> (not res!659873) (not e!556016))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986218 (= res!659873 (and (= (size!30427 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30428 _keys!1544) (size!30427 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986219 () Bool)

(declare-fun res!659869 () Bool)

(assert (=> b!986219 (=> (not res!659869) (not e!556016))))

(declare-datatypes ((List!20733 0))(
  ( (Nil!20730) (Cons!20729 (h!21891 (_ BitVec 64)) (t!29632 List!20733)) )
))
(declare-fun arrayNoDuplicates!0 (array!62183 (_ BitVec 32) List!20733) Bool)

(assert (=> b!986219 (= res!659869 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20730))))

(declare-fun res!659871 () Bool)

(assert (=> start!84304 (=> (not res!659871) (not e!556016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84304 (= res!659871 (validMask!0 mask!1948))))

(assert (=> start!84304 e!556016))

(assert (=> start!84304 true))

(declare-fun e!556014 () Bool)

(declare-fun array_inv!23145 (array!62181) Bool)

(assert (=> start!84304 (and (array_inv!23145 _values!1278) e!556014)))

(declare-fun array_inv!23146 (array!62183) Bool)

(assert (=> start!84304 (array_inv!23146 _keys!1544)))

(declare-fun b!986220 () Bool)

(declare-fun res!659870 () Bool)

(assert (=> b!986220 (=> (not res!659870) (not e!556016))))

(assert (=> b!986220 (= res!659870 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30428 _keys!1544))))))

(declare-fun b!986221 () Bool)

(declare-fun res!659872 () Bool)

(assert (=> b!986221 (=> (not res!659872) (not e!556016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62183 (_ BitVec 32)) Bool)

(assert (=> b!986221 (= res!659872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36689 () Bool)

(assert (=> mapIsEmpty!36689 mapRes!36689))

(declare-fun b!986222 () Bool)

(assert (=> b!986222 (= e!556014 (and e!556015 mapRes!36689))))

(declare-fun condMapEmpty!36689 () Bool)

(declare-fun mapDefault!36689 () ValueCell!11072)

