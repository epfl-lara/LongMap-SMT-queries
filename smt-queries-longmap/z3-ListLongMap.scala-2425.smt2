; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38310 () Bool)

(assert start!38310)

(declare-fun mapNonEmpty!16293 () Bool)

(declare-fun mapRes!16293 () Bool)

(declare-fun tp!32088 () Bool)

(declare-fun e!239215 () Bool)

(assert (=> mapNonEmpty!16293 (= mapRes!16293 (and tp!32088 e!239215))))

(declare-datatypes ((V!14157 0))(
  ( (V!14158 (val!4939 Int)) )
))
(declare-datatypes ((ValueCell!4551 0))(
  ( (ValueCellFull!4551 (v!7185 V!14157)) (EmptyCell!4551) )
))
(declare-fun mapRest!16293 () (Array (_ BitVec 32) ValueCell!4551))

(declare-datatypes ((array!23485 0))(
  ( (array!23486 (arr!11196 (Array (_ BitVec 32) ValueCell!4551)) (size!11548 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23485)

(declare-fun mapValue!16293 () ValueCell!4551)

(declare-fun mapKey!16293 () (_ BitVec 32))

(assert (=> mapNonEmpty!16293 (= (arr!11196 _values!549) (store mapRest!16293 mapKey!16293 mapValue!16293))))

(declare-fun b!395089 () Bool)

(declare-fun e!239214 () Bool)

(declare-fun tp_is_empty!9789 () Bool)

(assert (=> b!395089 (= e!239214 tp_is_empty!9789)))

(declare-fun b!395090 () Bool)

(declare-fun e!239213 () Bool)

(assert (=> b!395090 (= e!239213 false)))

(declare-fun lt!187063 () Bool)

(declare-datatypes ((array!23487 0))(
  ( (array!23488 (arr!11197 (Array (_ BitVec 32) (_ BitVec 64))) (size!11549 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23487)

(declare-datatypes ((List!6503 0))(
  ( (Nil!6500) (Cons!6499 (h!7355 (_ BitVec 64)) (t!11677 List!6503)) )
))
(declare-fun arrayNoDuplicates!0 (array!23487 (_ BitVec 32) List!6503) Bool)

(assert (=> b!395090 (= lt!187063 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6500))))

(declare-fun b!395091 () Bool)

(assert (=> b!395091 (= e!239215 tp_is_empty!9789)))

(declare-fun b!395092 () Bool)

(declare-fun e!239211 () Bool)

(assert (=> b!395092 (= e!239211 (and e!239214 mapRes!16293))))

(declare-fun condMapEmpty!16293 () Bool)

(declare-fun mapDefault!16293 () ValueCell!4551)

(assert (=> b!395092 (= condMapEmpty!16293 (= (arr!11196 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4551)) mapDefault!16293)))))

(declare-fun res!226477 () Bool)

(assert (=> start!38310 (=> (not res!226477) (not e!239213))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38310 (= res!226477 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11549 _keys!709))))))

(assert (=> start!38310 e!239213))

(assert (=> start!38310 true))

(declare-fun array_inv!8216 (array!23485) Bool)

(assert (=> start!38310 (and (array_inv!8216 _values!549) e!239211)))

(declare-fun array_inv!8217 (array!23487) Bool)

(assert (=> start!38310 (array_inv!8217 _keys!709)))

(declare-fun b!395093 () Bool)

(declare-fun res!226476 () Bool)

(assert (=> b!395093 (=> (not res!226476) (not e!239213))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23487 (_ BitVec 32)) Bool)

(assert (=> b!395093 (= res!226476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395094 () Bool)

(declare-fun res!226474 () Bool)

(assert (=> b!395094 (=> (not res!226474) (not e!239213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395094 (= res!226474 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16293 () Bool)

(assert (=> mapIsEmpty!16293 mapRes!16293))

(declare-fun b!395095 () Bool)

(declare-fun res!226475 () Bool)

(assert (=> b!395095 (=> (not res!226475) (not e!239213))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395095 (= res!226475 (and (= (size!11548 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11549 _keys!709) (size!11548 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38310 res!226477) b!395094))

(assert (= (and b!395094 res!226474) b!395095))

(assert (= (and b!395095 res!226475) b!395093))

(assert (= (and b!395093 res!226476) b!395090))

(assert (= (and b!395092 condMapEmpty!16293) mapIsEmpty!16293))

(assert (= (and b!395092 (not condMapEmpty!16293)) mapNonEmpty!16293))

(get-info :version)

(assert (= (and mapNonEmpty!16293 ((_ is ValueCellFull!4551) mapValue!16293)) b!395091))

(assert (= (and b!395092 ((_ is ValueCellFull!4551) mapDefault!16293)) b!395089))

(assert (= start!38310 b!395092))

(declare-fun m!391303 () Bool)

(assert (=> mapNonEmpty!16293 m!391303))

(declare-fun m!391305 () Bool)

(assert (=> b!395093 m!391305))

(declare-fun m!391307 () Bool)

(assert (=> start!38310 m!391307))

(declare-fun m!391309 () Bool)

(assert (=> start!38310 m!391309))

(declare-fun m!391311 () Bool)

(assert (=> b!395090 m!391311))

(declare-fun m!391313 () Bool)

(assert (=> b!395094 m!391313))

(check-sat (not start!38310) (not mapNonEmpty!16293) tp_is_empty!9789 (not b!395090) (not b!395094) (not b!395093))
(check-sat)
