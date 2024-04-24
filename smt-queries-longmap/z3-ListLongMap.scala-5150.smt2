; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70030 () Bool)

(assert start!70030)

(declare-fun mapIsEmpty!22600 () Bool)

(declare-fun mapRes!22600 () Bool)

(assert (=> mapIsEmpty!22600 mapRes!22600))

(declare-fun mapNonEmpty!22600 () Bool)

(declare-fun tp!43708 () Bool)

(declare-fun e!450489 () Bool)

(assert (=> mapNonEmpty!22600 (= mapRes!22600 (and tp!43708 e!450489))))

(declare-fun mapKey!22600 () (_ BitVec 32))

(declare-datatypes ((V!23691 0))(
  ( (V!23692 (val!7056 Int)) )
))
(declare-datatypes ((ValueCell!6593 0))(
  ( (ValueCellFull!6593 (v!9483 V!23691)) (EmptyCell!6593) )
))
(declare-datatypes ((array!44257 0))(
  ( (array!44258 (arr!21186 (Array (_ BitVec 32) ValueCell!6593)) (size!21606 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44257)

(declare-fun mapRest!22600 () (Array (_ BitVec 32) ValueCell!6593))

(declare-fun mapValue!22600 () ValueCell!6593)

(assert (=> mapNonEmpty!22600 (= (arr!21186 _values!788) (store mapRest!22600 mapKey!22600 mapValue!22600))))

(declare-fun b!813234 () Bool)

(declare-fun e!450490 () Bool)

(declare-fun e!450487 () Bool)

(assert (=> b!813234 (= e!450490 (and e!450487 mapRes!22600))))

(declare-fun condMapEmpty!22600 () Bool)

(declare-fun mapDefault!22600 () ValueCell!6593)

(assert (=> b!813234 (= condMapEmpty!22600 (= (arr!21186 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6593)) mapDefault!22600)))))

(declare-fun res!555475 () Bool)

(declare-fun e!450488 () Bool)

(assert (=> start!70030 (=> (not res!555475) (not e!450488))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70030 (= res!555475 (validMask!0 mask!1312))))

(assert (=> start!70030 e!450488))

(declare-datatypes ((array!44259 0))(
  ( (array!44260 (arr!21187 (Array (_ BitVec 32) (_ BitVec 64))) (size!21607 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44259)

(declare-fun array_inv!17033 (array!44259) Bool)

(assert (=> start!70030 (array_inv!17033 _keys!976)))

(assert (=> start!70030 true))

(declare-fun array_inv!17034 (array!44257) Bool)

(assert (=> start!70030 (and (array_inv!17034 _values!788) e!450490)))

(declare-fun b!813235 () Bool)

(declare-fun tp_is_empty!14017 () Bool)

(assert (=> b!813235 (= e!450487 tp_is_empty!14017)))

(declare-fun b!813236 () Bool)

(declare-fun res!555473 () Bool)

(assert (=> b!813236 (=> (not res!555473) (not e!450488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44259 (_ BitVec 32)) Bool)

(assert (=> b!813236 (= res!555473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813237 () Bool)

(declare-fun res!555474 () Bool)

(assert (=> b!813237 (=> (not res!555474) (not e!450488))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813237 (= res!555474 (and (= (size!21606 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21607 _keys!976) (size!21606 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813238 () Bool)

(assert (=> b!813238 (= e!450489 tp_is_empty!14017)))

(declare-fun b!813239 () Bool)

(assert (=> b!813239 (= e!450488 false)))

(declare-fun lt!364476 () Bool)

(declare-datatypes ((List!14995 0))(
  ( (Nil!14992) (Cons!14991 (h!16126 (_ BitVec 64)) (t!21302 List!14995)) )
))
(declare-fun arrayNoDuplicates!0 (array!44259 (_ BitVec 32) List!14995) Bool)

(assert (=> b!813239 (= lt!364476 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!14992))))

(assert (= (and start!70030 res!555475) b!813237))

(assert (= (and b!813237 res!555474) b!813236))

(assert (= (and b!813236 res!555473) b!813239))

(assert (= (and b!813234 condMapEmpty!22600) mapIsEmpty!22600))

(assert (= (and b!813234 (not condMapEmpty!22600)) mapNonEmpty!22600))

(get-info :version)

(assert (= (and mapNonEmpty!22600 ((_ is ValueCellFull!6593) mapValue!22600)) b!813238))

(assert (= (and b!813234 ((_ is ValueCellFull!6593) mapDefault!22600)) b!813235))

(assert (= start!70030 b!813234))

(declare-fun m!756043 () Bool)

(assert (=> mapNonEmpty!22600 m!756043))

(declare-fun m!756045 () Bool)

(assert (=> start!70030 m!756045))

(declare-fun m!756047 () Bool)

(assert (=> start!70030 m!756047))

(declare-fun m!756049 () Bool)

(assert (=> start!70030 m!756049))

(declare-fun m!756051 () Bool)

(assert (=> b!813236 m!756051))

(declare-fun m!756053 () Bool)

(assert (=> b!813239 m!756053))

(check-sat (not start!70030) tp_is_empty!14017 (not b!813239) (not mapNonEmpty!22600) (not b!813236))
(check-sat)
