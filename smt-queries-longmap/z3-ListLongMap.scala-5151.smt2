; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70036 () Bool)

(assert start!70036)

(declare-fun b!813288 () Bool)

(declare-fun e!450534 () Bool)

(assert (=> b!813288 (= e!450534 false)))

(declare-fun lt!364485 () Bool)

(declare-datatypes ((array!44269 0))(
  ( (array!44270 (arr!21192 (Array (_ BitVec 32) (_ BitVec 64))) (size!21612 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44269)

(declare-datatypes ((List!14996 0))(
  ( (Nil!14993) (Cons!14992 (h!16127 (_ BitVec 64)) (t!21303 List!14996)) )
))
(declare-fun arrayNoDuplicates!0 (array!44269 (_ BitVec 32) List!14996) Bool)

(assert (=> b!813288 (= lt!364485 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!14993))))

(declare-fun b!813289 () Bool)

(declare-fun e!450533 () Bool)

(declare-fun tp_is_empty!14023 () Bool)

(assert (=> b!813289 (= e!450533 tp_is_empty!14023)))

(declare-fun b!813290 () Bool)

(declare-fun e!450535 () Bool)

(declare-fun mapRes!22609 () Bool)

(assert (=> b!813290 (= e!450535 (and e!450533 mapRes!22609))))

(declare-fun condMapEmpty!22609 () Bool)

(declare-datatypes ((V!23699 0))(
  ( (V!23700 (val!7059 Int)) )
))
(declare-datatypes ((ValueCell!6596 0))(
  ( (ValueCellFull!6596 (v!9486 V!23699)) (EmptyCell!6596) )
))
(declare-datatypes ((array!44271 0))(
  ( (array!44272 (arr!21193 (Array (_ BitVec 32) ValueCell!6596)) (size!21613 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44271)

(declare-fun mapDefault!22609 () ValueCell!6596)

(assert (=> b!813290 (= condMapEmpty!22609 (= (arr!21193 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6596)) mapDefault!22609)))))

(declare-fun b!813291 () Bool)

(declare-fun res!555502 () Bool)

(assert (=> b!813291 (=> (not res!555502) (not e!450534))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!813291 (= res!555502 (and (= (size!21613 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21612 _keys!976) (size!21613 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22609 () Bool)

(declare-fun tp!43717 () Bool)

(declare-fun e!450536 () Bool)

(assert (=> mapNonEmpty!22609 (= mapRes!22609 (and tp!43717 e!450536))))

(declare-fun mapRest!22609 () (Array (_ BitVec 32) ValueCell!6596))

(declare-fun mapValue!22609 () ValueCell!6596)

(declare-fun mapKey!22609 () (_ BitVec 32))

(assert (=> mapNonEmpty!22609 (= (arr!21193 _values!788) (store mapRest!22609 mapKey!22609 mapValue!22609))))

(declare-fun b!813292 () Bool)

(declare-fun res!555500 () Bool)

(assert (=> b!813292 (=> (not res!555500) (not e!450534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44269 (_ BitVec 32)) Bool)

(assert (=> b!813292 (= res!555500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555501 () Bool)

(assert (=> start!70036 (=> (not res!555501) (not e!450534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70036 (= res!555501 (validMask!0 mask!1312))))

(assert (=> start!70036 e!450534))

(declare-fun array_inv!17037 (array!44269) Bool)

(assert (=> start!70036 (array_inv!17037 _keys!976)))

(assert (=> start!70036 true))

(declare-fun array_inv!17038 (array!44271) Bool)

(assert (=> start!70036 (and (array_inv!17038 _values!788) e!450535)))

(declare-fun b!813293 () Bool)

(assert (=> b!813293 (= e!450536 tp_is_empty!14023)))

(declare-fun mapIsEmpty!22609 () Bool)

(assert (=> mapIsEmpty!22609 mapRes!22609))

(assert (= (and start!70036 res!555501) b!813291))

(assert (= (and b!813291 res!555502) b!813292))

(assert (= (and b!813292 res!555500) b!813288))

(assert (= (and b!813290 condMapEmpty!22609) mapIsEmpty!22609))

(assert (= (and b!813290 (not condMapEmpty!22609)) mapNonEmpty!22609))

(get-info :version)

(assert (= (and mapNonEmpty!22609 ((_ is ValueCellFull!6596) mapValue!22609)) b!813293))

(assert (= (and b!813290 ((_ is ValueCellFull!6596) mapDefault!22609)) b!813289))

(assert (= start!70036 b!813290))

(declare-fun m!756079 () Bool)

(assert (=> b!813288 m!756079))

(declare-fun m!756081 () Bool)

(assert (=> mapNonEmpty!22609 m!756081))

(declare-fun m!756083 () Bool)

(assert (=> b!813292 m!756083))

(declare-fun m!756085 () Bool)

(assert (=> start!70036 m!756085))

(declare-fun m!756087 () Bool)

(assert (=> start!70036 m!756087))

(declare-fun m!756089 () Bool)

(assert (=> start!70036 m!756089))

(check-sat (not start!70036) tp_is_empty!14023 (not mapNonEmpty!22609) (not b!813288) (not b!813292))
(check-sat)
