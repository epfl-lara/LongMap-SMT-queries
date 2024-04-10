; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84312 () Bool)

(assert start!84312)

(declare-fun b!986308 () Bool)

(declare-fun res!659926 () Bool)

(declare-fun e!556077 () Bool)

(assert (=> b!986308 (=> (not res!659926) (not e!556077))))

(declare-datatypes ((array!62197 0))(
  ( (array!62198 (arr!29956 (Array (_ BitVec 32) (_ BitVec 64))) (size!30435 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62197)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62197 (_ BitVec 32)) Bool)

(assert (=> b!986308 (= res!659926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36701 () Bool)

(declare-fun mapRes!36701 () Bool)

(declare-fun tp!69556 () Bool)

(declare-fun e!556076 () Bool)

(assert (=> mapNonEmpty!36701 (= mapRes!36701 (and tp!69556 e!556076))))

(declare-datatypes ((V!35803 0))(
  ( (V!35804 (val!11608 Int)) )
))
(declare-datatypes ((ValueCell!11076 0))(
  ( (ValueCellFull!11076 (v!14170 V!35803)) (EmptyCell!11076) )
))
(declare-datatypes ((array!62199 0))(
  ( (array!62200 (arr!29957 (Array (_ BitVec 32) ValueCell!11076)) (size!30436 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62199)

(declare-fun mapRest!36701 () (Array (_ BitVec 32) ValueCell!11076))

(declare-fun mapValue!36701 () ValueCell!11076)

(declare-fun mapKey!36701 () (_ BitVec 32))

(assert (=> mapNonEmpty!36701 (= (arr!29957 _values!1278) (store mapRest!36701 mapKey!36701 mapValue!36701))))

(declare-fun b!986309 () Bool)

(declare-fun e!556074 () Bool)

(declare-fun e!556073 () Bool)

(assert (=> b!986309 (= e!556074 (and e!556073 mapRes!36701))))

(declare-fun condMapEmpty!36701 () Bool)

(declare-fun mapDefault!36701 () ValueCell!11076)

(assert (=> b!986309 (= condMapEmpty!36701 (= (arr!29957 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11076)) mapDefault!36701)))))

(declare-fun res!659927 () Bool)

(assert (=> start!84312 (=> (not res!659927) (not e!556077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84312 (= res!659927 (validMask!0 mask!1948))))

(assert (=> start!84312 e!556077))

(assert (=> start!84312 true))

(declare-fun array_inv!23153 (array!62199) Bool)

(assert (=> start!84312 (and (array_inv!23153 _values!1278) e!556074)))

(declare-fun array_inv!23154 (array!62197) Bool)

(assert (=> start!84312 (array_inv!23154 _keys!1544)))

(declare-fun b!986310 () Bool)

(declare-fun res!659925 () Bool)

(assert (=> b!986310 (=> (not res!659925) (not e!556077))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986310 (= res!659925 (and (= (size!30436 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30435 _keys!1544) (size!30436 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986311 () Bool)

(assert (=> b!986311 (= e!556077 false)))

(declare-fun lt!437468 () Bool)

(declare-datatypes ((List!20737 0))(
  ( (Nil!20734) (Cons!20733 (h!21895 (_ BitVec 64)) (t!29636 List!20737)) )
))
(declare-fun arrayNoDuplicates!0 (array!62197 (_ BitVec 32) List!20737) Bool)

(assert (=> b!986311 (= lt!437468 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20734))))

(declare-fun b!986312 () Bool)

(declare-fun tp_is_empty!23115 () Bool)

(assert (=> b!986312 (= e!556076 tp_is_empty!23115)))

(declare-fun b!986313 () Bool)

(assert (=> b!986313 (= e!556073 tp_is_empty!23115)))

(declare-fun mapIsEmpty!36701 () Bool)

(assert (=> mapIsEmpty!36701 mapRes!36701))

(assert (= (and start!84312 res!659927) b!986310))

(assert (= (and b!986310 res!659925) b!986308))

(assert (= (and b!986308 res!659926) b!986311))

(assert (= (and b!986309 condMapEmpty!36701) mapIsEmpty!36701))

(assert (= (and b!986309 (not condMapEmpty!36701)) mapNonEmpty!36701))

(get-info :version)

(assert (= (and mapNonEmpty!36701 ((_ is ValueCellFull!11076) mapValue!36701)) b!986312))

(assert (= (and b!986309 ((_ is ValueCellFull!11076) mapDefault!36701)) b!986313))

(assert (= start!84312 b!986309))

(declare-fun m!913183 () Bool)

(assert (=> b!986308 m!913183))

(declare-fun m!913185 () Bool)

(assert (=> mapNonEmpty!36701 m!913185))

(declare-fun m!913187 () Bool)

(assert (=> start!84312 m!913187))

(declare-fun m!913189 () Bool)

(assert (=> start!84312 m!913189))

(declare-fun m!913191 () Bool)

(assert (=> start!84312 m!913191))

(declare-fun m!913193 () Bool)

(assert (=> b!986311 m!913193))

(check-sat (not mapNonEmpty!36701) tp_is_empty!23115 (not b!986311) (not b!986308) (not start!84312))
(check-sat)
