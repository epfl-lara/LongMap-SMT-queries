; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84302 () Bool)

(assert start!84302)

(declare-fun mapNonEmpty!36686 () Bool)

(declare-fun mapRes!36686 () Bool)

(declare-fun tp!69541 () Bool)

(declare-fun e!556002 () Bool)

(assert (=> mapNonEmpty!36686 (= mapRes!36686 (and tp!69541 e!556002))))

(declare-datatypes ((V!35789 0))(
  ( (V!35790 (val!11603 Int)) )
))
(declare-datatypes ((ValueCell!11071 0))(
  ( (ValueCellFull!11071 (v!14165 V!35789)) (EmptyCell!11071) )
))
(declare-datatypes ((array!62177 0))(
  ( (array!62178 (arr!29946 (Array (_ BitVec 32) ValueCell!11071)) (size!30425 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62177)

(declare-fun mapKey!36686 () (_ BitVec 32))

(declare-fun mapValue!36686 () ValueCell!11071)

(declare-fun mapRest!36686 () (Array (_ BitVec 32) ValueCell!11071))

(assert (=> mapNonEmpty!36686 (= (arr!29946 _values!1278) (store mapRest!36686 mapKey!36686 mapValue!36686))))

(declare-fun b!986191 () Bool)

(declare-fun e!555998 () Bool)

(assert (=> b!986191 (= e!555998 false)))

(declare-fun lt!437453 () Bool)

(declare-datatypes ((array!62179 0))(
  ( (array!62180 (arr!29947 (Array (_ BitVec 32) (_ BitVec 64))) (size!30426 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62179)

(declare-datatypes ((List!20732 0))(
  ( (Nil!20729) (Cons!20728 (h!21890 (_ BitVec 64)) (t!29631 List!20732)) )
))
(declare-fun arrayNoDuplicates!0 (array!62179 (_ BitVec 32) List!20732) Bool)

(assert (=> b!986191 (= lt!437453 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20729))))

(declare-fun res!659853 () Bool)

(assert (=> start!84302 (=> (not res!659853) (not e!555998))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84302 (= res!659853 (validMask!0 mask!1948))))

(assert (=> start!84302 e!555998))

(assert (=> start!84302 true))

(declare-fun e!556000 () Bool)

(declare-fun array_inv!23143 (array!62177) Bool)

(assert (=> start!84302 (and (array_inv!23143 _values!1278) e!556000)))

(declare-fun array_inv!23144 (array!62179) Bool)

(assert (=> start!84302 (array_inv!23144 _keys!1544)))

(declare-fun b!986192 () Bool)

(declare-fun e!555999 () Bool)

(assert (=> b!986192 (= e!556000 (and e!555999 mapRes!36686))))

(declare-fun condMapEmpty!36686 () Bool)

(declare-fun mapDefault!36686 () ValueCell!11071)

