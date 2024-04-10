; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107328 () Bool)

(assert start!107328)

(declare-fun b!1271992 () Bool)

(declare-fun e!725460 () Bool)

(declare-fun tp_is_empty!33017 () Bool)

(assert (=> b!1271992 (= e!725460 tp_is_empty!33017)))

(declare-fun b!1271993 () Bool)

(declare-fun res!846200 () Bool)

(declare-fun e!725463 () Bool)

(assert (=> b!1271993 (=> (not res!846200) (not e!725463))))

(declare-datatypes ((array!83282 0))(
  ( (array!83283 (arr!40178 (Array (_ BitVec 32) (_ BitVec 64))) (size!40714 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83282)

(declare-datatypes ((List!28548 0))(
  ( (Nil!28545) (Cons!28544 (h!29753 (_ BitVec 64)) (t!42077 List!28548)) )
))
(declare-fun arrayNoDuplicates!0 (array!83282 (_ BitVec 32) List!28548) Bool)

(assert (=> b!1271993 (= res!846200 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28545))))

(declare-fun b!1271994 () Bool)

(declare-fun e!725459 () Bool)

(assert (=> b!1271994 (= e!725459 tp_is_empty!33017)))

(declare-fun b!1271995 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271995 (= e!725463 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40714 _keys!1364)) (bvslt from!1698 (size!40714 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvsge (bvsub (size!40714 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (bvsub (size!40714 _keys!1364) from!1698))))))

(declare-fun b!1271996 () Bool)

(declare-fun res!846197 () Bool)

(assert (=> b!1271996 (=> (not res!846197) (not e!725463))))

(declare-datatypes ((V!49215 0))(
  ( (V!49216 (val!16583 Int)) )
))
(declare-datatypes ((ValueCell!15655 0))(
  ( (ValueCellFull!15655 (v!19220 V!49215)) (EmptyCell!15655) )
))
(declare-datatypes ((array!83284 0))(
  ( (array!83285 (arr!40179 (Array (_ BitVec 32) ValueCell!15655)) (size!40715 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83284)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271996 (= res!846197 (and (= (size!40715 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40714 _keys!1364) (size!40715 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51106 () Bool)

(declare-fun mapRes!51106 () Bool)

(declare-fun tp!97447 () Bool)

(assert (=> mapNonEmpty!51106 (= mapRes!51106 (and tp!97447 e!725460))))

(declare-fun mapValue!51106 () ValueCell!15655)

(declare-fun mapRest!51106 () (Array (_ BitVec 32) ValueCell!15655))

(declare-fun mapKey!51106 () (_ BitVec 32))

(assert (=> mapNonEmpty!51106 (= (arr!40179 _values!1134) (store mapRest!51106 mapKey!51106 mapValue!51106))))

(declare-fun mapIsEmpty!51106 () Bool)

(assert (=> mapIsEmpty!51106 mapRes!51106))

(declare-fun res!846199 () Bool)

(assert (=> start!107328 (=> (not res!846199) (not e!725463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107328 (= res!846199 (validMask!0 mask!1730))))

(assert (=> start!107328 e!725463))

(declare-fun e!725461 () Bool)

(declare-fun array_inv!30563 (array!83284) Bool)

(assert (=> start!107328 (and (array_inv!30563 _values!1134) e!725461)))

(assert (=> start!107328 true))

(declare-fun array_inv!30564 (array!83282) Bool)

(assert (=> start!107328 (array_inv!30564 _keys!1364)))

(declare-fun b!1271997 () Bool)

(declare-fun res!846198 () Bool)

(assert (=> b!1271997 (=> (not res!846198) (not e!725463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83282 (_ BitVec 32)) Bool)

(assert (=> b!1271997 (= res!846198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271998 () Bool)

(assert (=> b!1271998 (= e!725461 (and e!725459 mapRes!51106))))

(declare-fun condMapEmpty!51106 () Bool)

(declare-fun mapDefault!51106 () ValueCell!15655)

