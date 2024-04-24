; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110670 () Bool)

(assert start!110670)

(declare-fun b!1307923 () Bool)

(declare-fun e!746311 () Bool)

(declare-fun tp_is_empty!35011 () Bool)

(assert (=> b!1307923 (= e!746311 tp_is_empty!35011)))

(declare-fun b!1307924 () Bool)

(declare-fun e!746312 () Bool)

(declare-fun mapRes!54145 () Bool)

(assert (=> b!1307924 (= e!746312 (and e!746311 mapRes!54145))))

(declare-fun condMapEmpty!54145 () Bool)

(declare-datatypes ((V!51785 0))(
  ( (V!51786 (val!17580 Int)) )
))
(declare-datatypes ((ValueCell!16607 0))(
  ( (ValueCellFull!16607 (v!20202 V!51785)) (EmptyCell!16607) )
))
(declare-datatypes ((array!87093 0))(
  ( (array!87094 (arr!42022 (Array (_ BitVec 32) ValueCell!16607)) (size!42573 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87093)

(declare-fun mapDefault!54145 () ValueCell!16607)

(assert (=> b!1307924 (= condMapEmpty!54145 (= (arr!42022 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16607)) mapDefault!54145)))))

(declare-fun mapNonEmpty!54145 () Bool)

(declare-fun tp!103225 () Bool)

(declare-fun e!746314 () Bool)

(assert (=> mapNonEmpty!54145 (= mapRes!54145 (and tp!103225 e!746314))))

(declare-fun mapKey!54145 () (_ BitVec 32))

(declare-fun mapValue!54145 () ValueCell!16607)

(declare-fun mapRest!54145 () (Array (_ BitVec 32) ValueCell!16607))

(assert (=> mapNonEmpty!54145 (= (arr!42022 _values!1354) (store mapRest!54145 mapKey!54145 mapValue!54145))))

(declare-fun mapIsEmpty!54145 () Bool)

(assert (=> mapIsEmpty!54145 mapRes!54145))

(declare-fun b!1307925 () Bool)

(declare-fun res!867923 () Bool)

(declare-fun e!746315 () Bool)

(assert (=> b!1307925 (=> (not res!867923) (not e!746315))))

(declare-datatypes ((array!87095 0))(
  ( (array!87096 (arr!42023 (Array (_ BitVec 32) (_ BitVec 64))) (size!42574 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87095)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307925 (= res!867923 (and (= (size!42573 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42574 _keys!1628) (size!42573 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867921 () Bool)

(assert (=> start!110670 (=> (not res!867921) (not e!746315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110670 (= res!867921 (validMask!0 mask!2040))))

(assert (=> start!110670 e!746315))

(assert (=> start!110670 true))

(declare-fun array_inv!32027 (array!87093) Bool)

(assert (=> start!110670 (and (array_inv!32027 _values!1354) e!746312)))

(declare-fun array_inv!32028 (array!87095) Bool)

(assert (=> start!110670 (array_inv!32028 _keys!1628)))

(declare-fun b!1307926 () Bool)

(assert (=> b!1307926 (= e!746314 tp_is_empty!35011)))

(declare-fun b!1307927 () Bool)

(declare-fun res!867922 () Bool)

(assert (=> b!1307927 (=> (not res!867922) (not e!746315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87095 (_ BitVec 32)) Bool)

(assert (=> b!1307927 (= res!867922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307928 () Bool)

(assert (=> b!1307928 (= e!746315 false)))

(declare-fun lt!585425 () Bool)

(declare-datatypes ((List!29842 0))(
  ( (Nil!29839) (Cons!29838 (h!31056 (_ BitVec 64)) (t!43440 List!29842)) )
))
(declare-fun arrayNoDuplicates!0 (array!87095 (_ BitVec 32) List!29842) Bool)

(assert (=> b!1307928 (= lt!585425 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29839))))

(assert (= (and start!110670 res!867921) b!1307925))

(assert (= (and b!1307925 res!867923) b!1307927))

(assert (= (and b!1307927 res!867922) b!1307928))

(assert (= (and b!1307924 condMapEmpty!54145) mapIsEmpty!54145))

(assert (= (and b!1307924 (not condMapEmpty!54145)) mapNonEmpty!54145))

(get-info :version)

(assert (= (and mapNonEmpty!54145 ((_ is ValueCellFull!16607) mapValue!54145)) b!1307926))

(assert (= (and b!1307924 ((_ is ValueCellFull!16607) mapDefault!54145)) b!1307923))

(assert (= start!110670 b!1307924))

(declare-fun m!1199195 () Bool)

(assert (=> mapNonEmpty!54145 m!1199195))

(declare-fun m!1199197 () Bool)

(assert (=> start!110670 m!1199197))

(declare-fun m!1199199 () Bool)

(assert (=> start!110670 m!1199199))

(declare-fun m!1199201 () Bool)

(assert (=> start!110670 m!1199201))

(declare-fun m!1199203 () Bool)

(assert (=> b!1307927 m!1199203))

(declare-fun m!1199205 () Bool)

(assert (=> b!1307928 m!1199205))

(check-sat (not b!1307928) tp_is_empty!35011 (not b!1307927) (not start!110670) (not mapNonEmpty!54145))
(check-sat)
