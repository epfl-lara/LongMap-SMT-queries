; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84304 () Bool)

(assert start!84304)

(declare-fun b!984625 () Bool)

(declare-fun e!555177 () Bool)

(declare-fun e!555175 () Bool)

(declare-fun mapRes!36437 () Bool)

(assert (=> b!984625 (= e!555177 (and e!555175 mapRes!36437))))

(declare-fun condMapEmpty!36437 () Bool)

(declare-datatypes ((V!35569 0))(
  ( (V!35570 (val!11520 Int)) )
))
(declare-datatypes ((ValueCell!10988 0))(
  ( (ValueCellFull!10988 (v!14079 V!35569)) (EmptyCell!10988) )
))
(declare-datatypes ((array!61900 0))(
  ( (array!61901 (arr!29803 (Array (_ BitVec 32) ValueCell!10988)) (size!30283 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61900)

(declare-fun mapDefault!36437 () ValueCell!10988)

(assert (=> b!984625 (= condMapEmpty!36437 (= (arr!29803 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10988)) mapDefault!36437)))))

(declare-fun b!984626 () Bool)

(declare-fun res!658588 () Bool)

(declare-fun e!555174 () Bool)

(assert (=> b!984626 (=> (not res!658588) (not e!555174))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61902 0))(
  ( (array!61903 (arr!29804 (Array (_ BitVec 32) (_ BitVec 64))) (size!30284 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61902)

(assert (=> b!984626 (= res!658588 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30284 _keys!1544))))))

(declare-fun b!984627 () Bool)

(declare-fun res!658583 () Bool)

(assert (=> b!984627 (=> (not res!658583) (not e!555174))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61902 (_ BitVec 32)) Bool)

(assert (=> b!984627 (= res!658583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984628 () Bool)

(declare-fun e!555173 () Bool)

(declare-fun tp_is_empty!22939 () Bool)

(assert (=> b!984628 (= e!555173 tp_is_empty!22939)))

(declare-fun b!984629 () Bool)

(declare-fun res!658585 () Bool)

(assert (=> b!984629 (=> (not res!658585) (not e!555174))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984629 (= res!658585 (and (= (size!30283 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30284 _keys!1544) (size!30283 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984630 () Bool)

(declare-fun res!658584 () Bool)

(assert (=> b!984630 (=> (not res!658584) (not e!555174))))

(declare-datatypes ((List!20637 0))(
  ( (Nil!20634) (Cons!20633 (h!21801 (_ BitVec 64)) (t!29420 List!20637)) )
))
(declare-fun arrayNoDuplicates!0 (array!61902 (_ BitVec 32) List!20637) Bool)

(assert (=> b!984630 (= res!658584 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20634))))

(declare-fun b!984631 () Bool)

(assert (=> b!984631 (= e!555175 tp_is_empty!22939)))

(declare-fun b!984632 () Bool)

(assert (=> b!984632 (= e!555174 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!36437 () Bool)

(assert (=> mapIsEmpty!36437 mapRes!36437))

(declare-fun res!658586 () Bool)

(assert (=> start!84304 (=> (not res!658586) (not e!555174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84304 (= res!658586 (validMask!0 mask!1948))))

(assert (=> start!84304 e!555174))

(assert (=> start!84304 true))

(declare-fun array_inv!23061 (array!61900) Bool)

(assert (=> start!84304 (and (array_inv!23061 _values!1278) e!555177)))

(declare-fun array_inv!23062 (array!61902) Bool)

(assert (=> start!84304 (array_inv!23062 _keys!1544)))

(declare-fun b!984633 () Bool)

(declare-fun res!658587 () Bool)

(assert (=> b!984633 (=> (not res!658587) (not e!555174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984633 (= res!658587 (validKeyInArray!0 (select (arr!29804 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36437 () Bool)

(declare-fun tp!69122 () Bool)

(assert (=> mapNonEmpty!36437 (= mapRes!36437 (and tp!69122 e!555173))))

(declare-fun mapKey!36437 () (_ BitVec 32))

(declare-fun mapValue!36437 () ValueCell!10988)

(declare-fun mapRest!36437 () (Array (_ BitVec 32) ValueCell!10988))

(assert (=> mapNonEmpty!36437 (= (arr!29803 _values!1278) (store mapRest!36437 mapKey!36437 mapValue!36437))))

(assert (= (and start!84304 res!658586) b!984629))

(assert (= (and b!984629 res!658585) b!984627))

(assert (= (and b!984627 res!658583) b!984630))

(assert (= (and b!984630 res!658584) b!984626))

(assert (= (and b!984626 res!658588) b!984633))

(assert (= (and b!984633 res!658587) b!984632))

(assert (= (and b!984625 condMapEmpty!36437) mapIsEmpty!36437))

(assert (= (and b!984625 (not condMapEmpty!36437)) mapNonEmpty!36437))

(get-info :version)

(assert (= (and mapNonEmpty!36437 ((_ is ValueCellFull!10988) mapValue!36437)) b!984628))

(assert (= (and b!984625 ((_ is ValueCellFull!10988) mapDefault!36437)) b!984631))

(assert (= start!84304 b!984625))

(declare-fun m!912191 () Bool)

(assert (=> b!984627 m!912191))

(declare-fun m!912193 () Bool)

(assert (=> b!984633 m!912193))

(assert (=> b!984633 m!912193))

(declare-fun m!912195 () Bool)

(assert (=> b!984633 m!912195))

(declare-fun m!912197 () Bool)

(assert (=> b!984630 m!912197))

(declare-fun m!912199 () Bool)

(assert (=> start!84304 m!912199))

(declare-fun m!912201 () Bool)

(assert (=> start!84304 m!912201))

(declare-fun m!912203 () Bool)

(assert (=> start!84304 m!912203))

(declare-fun m!912205 () Bool)

(assert (=> mapNonEmpty!36437 m!912205))

(check-sat (not b!984630) (not start!84304) tp_is_empty!22939 (not mapNonEmpty!36437) (not b!984633) (not b!984627))
(check-sat)
