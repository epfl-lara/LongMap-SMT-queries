; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70042 () Bool)

(assert start!70042)

(declare-fun b!813342 () Bool)

(declare-fun e!450578 () Bool)

(declare-fun tp_is_empty!14029 () Bool)

(assert (=> b!813342 (= e!450578 tp_is_empty!14029)))

(declare-fun b!813343 () Bool)

(declare-fun e!450581 () Bool)

(declare-fun e!450579 () Bool)

(declare-fun mapRes!22618 () Bool)

(assert (=> b!813343 (= e!450581 (and e!450579 mapRes!22618))))

(declare-fun condMapEmpty!22618 () Bool)

(declare-datatypes ((V!23707 0))(
  ( (V!23708 (val!7062 Int)) )
))
(declare-datatypes ((ValueCell!6599 0))(
  ( (ValueCellFull!6599 (v!9489 V!23707)) (EmptyCell!6599) )
))
(declare-datatypes ((array!44281 0))(
  ( (array!44282 (arr!21198 (Array (_ BitVec 32) ValueCell!6599)) (size!21618 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44281)

(declare-fun mapDefault!22618 () ValueCell!6599)

(assert (=> b!813343 (= condMapEmpty!22618 (= (arr!21198 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6599)) mapDefault!22618)))))

(declare-fun mapNonEmpty!22618 () Bool)

(declare-fun tp!43726 () Bool)

(assert (=> mapNonEmpty!22618 (= mapRes!22618 (and tp!43726 e!450578))))

(declare-fun mapKey!22618 () (_ BitVec 32))

(declare-fun mapValue!22618 () ValueCell!6599)

(declare-fun mapRest!22618 () (Array (_ BitVec 32) ValueCell!6599))

(assert (=> mapNonEmpty!22618 (= (arr!21198 _values!788) (store mapRest!22618 mapKey!22618 mapValue!22618))))

(declare-fun mapIsEmpty!22618 () Bool)

(assert (=> mapIsEmpty!22618 mapRes!22618))

(declare-fun b!813344 () Bool)

(assert (=> b!813344 (= e!450579 tp_is_empty!14029)))

(declare-fun res!555529 () Bool)

(declare-fun e!450580 () Bool)

(assert (=> start!70042 (=> (not res!555529) (not e!450580))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70042 (= res!555529 (validMask!0 mask!1312))))

(assert (=> start!70042 e!450580))

(declare-datatypes ((array!44283 0))(
  ( (array!44284 (arr!21199 (Array (_ BitVec 32) (_ BitVec 64))) (size!21619 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44283)

(declare-fun array_inv!17041 (array!44283) Bool)

(assert (=> start!70042 (array_inv!17041 _keys!976)))

(assert (=> start!70042 true))

(declare-fun array_inv!17042 (array!44281) Bool)

(assert (=> start!70042 (and (array_inv!17042 _values!788) e!450581)))

(declare-fun b!813345 () Bool)

(declare-fun res!555528 () Bool)

(assert (=> b!813345 (=> (not res!555528) (not e!450580))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813345 (= res!555528 (and (= (size!21618 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21619 _keys!976) (size!21618 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813346 () Bool)

(assert (=> b!813346 (= e!450580 false)))

(declare-fun lt!364494 () Bool)

(declare-datatypes ((List!14998 0))(
  ( (Nil!14995) (Cons!14994 (h!16129 (_ BitVec 64)) (t!21305 List!14998)) )
))
(declare-fun arrayNoDuplicates!0 (array!44283 (_ BitVec 32) List!14998) Bool)

(assert (=> b!813346 (= lt!364494 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!14995))))

(declare-fun b!813347 () Bool)

(declare-fun res!555527 () Bool)

(assert (=> b!813347 (=> (not res!555527) (not e!450580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44283 (_ BitVec 32)) Bool)

(assert (=> b!813347 (= res!555527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70042 res!555529) b!813345))

(assert (= (and b!813345 res!555528) b!813347))

(assert (= (and b!813347 res!555527) b!813346))

(assert (= (and b!813343 condMapEmpty!22618) mapIsEmpty!22618))

(assert (= (and b!813343 (not condMapEmpty!22618)) mapNonEmpty!22618))

(get-info :version)

(assert (= (and mapNonEmpty!22618 ((_ is ValueCellFull!6599) mapValue!22618)) b!813342))

(assert (= (and b!813343 ((_ is ValueCellFull!6599) mapDefault!22618)) b!813344))

(assert (= start!70042 b!813343))

(declare-fun m!756115 () Bool)

(assert (=> mapNonEmpty!22618 m!756115))

(declare-fun m!756117 () Bool)

(assert (=> start!70042 m!756117))

(declare-fun m!756119 () Bool)

(assert (=> start!70042 m!756119))

(declare-fun m!756121 () Bool)

(assert (=> start!70042 m!756121))

(declare-fun m!756123 () Bool)

(assert (=> b!813346 m!756123))

(declare-fun m!756125 () Bool)

(assert (=> b!813347 m!756125))

(check-sat (not b!813346) (not mapNonEmpty!22618) (not start!70042) (not b!813347) tp_is_empty!14029)
(check-sat)
