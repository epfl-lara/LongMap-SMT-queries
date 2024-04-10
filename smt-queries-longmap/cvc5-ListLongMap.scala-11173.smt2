; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130634 () Bool)

(assert start!130634)

(declare-fun b!1532593 () Bool)

(declare-fun e!853914 () Bool)

(declare-datatypes ((List!35574 0))(
  ( (Nil!35571) (Cons!35570 (h!37015 (_ BitVec 64)) (t!50268 List!35574)) )
))
(declare-fun contains!10007 (List!35574 (_ BitVec 64)) Bool)

(assert (=> b!1532593 (= e!853914 (contains!10007 Nil!35571 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532594 () Bool)

(declare-fun res!1049703 () Bool)

(declare-fun e!853913 () Bool)

(assert (=> b!1532594 (=> (not res!1049703) (not e!853913))))

(declare-datatypes ((array!101765 0))(
  ( (array!101766 (arr!49100 (Array (_ BitVec 32) (_ BitVec 64))) (size!49650 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101765)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532594 (= res!1049703 (and (= (size!49650 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49650 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49650 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049698 () Bool)

(assert (=> start!130634 (=> (not res!1049698) (not e!853913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130634 (= res!1049698 (validMask!0 mask!2480))))

(assert (=> start!130634 e!853913))

(assert (=> start!130634 true))

(declare-fun array_inv!38128 (array!101765) Bool)

(assert (=> start!130634 (array_inv!38128 a!2792)))

(declare-fun b!1532595 () Bool)

(declare-fun res!1049697 () Bool)

(assert (=> b!1532595 (=> (not res!1049697) (not e!853913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101765 (_ BitVec 32)) Bool)

(assert (=> b!1532595 (= res!1049697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532596 () Bool)

(assert (=> b!1532596 (= e!853913 e!853914)))

(declare-fun res!1049702 () Bool)

(assert (=> b!1532596 (=> res!1049702 e!853914)))

(assert (=> b!1532596 (= res!1049702 (contains!10007 Nil!35571 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532597 () Bool)

(declare-fun res!1049701 () Bool)

(assert (=> b!1532597 (=> (not res!1049701) (not e!853913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532597 (= res!1049701 (validKeyInArray!0 (select (arr!49100 a!2792) j!64)))))

(declare-fun b!1532598 () Bool)

(declare-fun res!1049699 () Bool)

(assert (=> b!1532598 (=> (not res!1049699) (not e!853913))))

(assert (=> b!1532598 (= res!1049699 (and (bvsle #b00000000000000000000000000000000 (size!49650 a!2792)) (bvslt (size!49650 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1532599 () Bool)

(declare-fun res!1049704 () Bool)

(assert (=> b!1532599 (=> (not res!1049704) (not e!853913))))

(assert (=> b!1532599 (= res!1049704 (validKeyInArray!0 (select (arr!49100 a!2792) i!951)))))

(declare-fun b!1532600 () Bool)

(declare-fun res!1049700 () Bool)

(assert (=> b!1532600 (=> (not res!1049700) (not e!853913))))

(declare-fun noDuplicate!2633 (List!35574) Bool)

(assert (=> b!1532600 (= res!1049700 (noDuplicate!2633 Nil!35571))))

(assert (= (and start!130634 res!1049698) b!1532594))

(assert (= (and b!1532594 res!1049703) b!1532599))

(assert (= (and b!1532599 res!1049704) b!1532597))

(assert (= (and b!1532597 res!1049701) b!1532595))

(assert (= (and b!1532595 res!1049697) b!1532598))

(assert (= (and b!1532598 res!1049699) b!1532600))

(assert (= (and b!1532600 res!1049700) b!1532596))

(assert (= (and b!1532596 (not res!1049702)) b!1532593))

(declare-fun m!1415301 () Bool)

(assert (=> b!1532597 m!1415301))

(assert (=> b!1532597 m!1415301))

(declare-fun m!1415303 () Bool)

(assert (=> b!1532597 m!1415303))

(declare-fun m!1415305 () Bool)

(assert (=> b!1532596 m!1415305))

(declare-fun m!1415307 () Bool)

(assert (=> b!1532593 m!1415307))

(declare-fun m!1415309 () Bool)

(assert (=> start!130634 m!1415309))

(declare-fun m!1415311 () Bool)

(assert (=> start!130634 m!1415311))

(declare-fun m!1415313 () Bool)

(assert (=> b!1532600 m!1415313))

(declare-fun m!1415315 () Bool)

(assert (=> b!1532599 m!1415315))

(assert (=> b!1532599 m!1415315))

(declare-fun m!1415317 () Bool)

(assert (=> b!1532599 m!1415317))

(declare-fun m!1415319 () Bool)

(assert (=> b!1532595 m!1415319))

(push 1)

(assert (not b!1532593))

(assert (not b!1532596))

(assert (not b!1532597))

(assert (not b!1532599))

(assert (not start!130634))

(assert (not b!1532595))

(assert (not b!1532600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160115 () Bool)

(declare-fun lt!663694 () Bool)

(declare-fun content!791 (List!35574) (Set (_ BitVec 64)))

(assert (=> d!160115 (= lt!663694 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!791 Nil!35571)))))

(declare-fun e!853949 () Bool)

(assert (=> d!160115 (= lt!663694 e!853949)))

(declare-fun res!1049767 () Bool)

(assert (=> d!160115 (=> (not res!1049767) (not e!853949))))

(assert (=> d!160115 (= res!1049767 (is-Cons!35570 Nil!35571))))

(assert (=> d!160115 (= (contains!10007 Nil!35571 #b0000000000000000000000000000000000000000000000000000000000000000) lt!663694)))

(declare-fun b!1532663 () Bool)

(declare-fun e!853948 () Bool)

(assert (=> b!1532663 (= e!853949 e!853948)))

(declare-fun res!1049768 () Bool)

(assert (=> b!1532663 (=> res!1049768 e!853948)))

(assert (=> b!1532663 (= res!1049768 (= (h!37015 Nil!35571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532664 () Bool)

(assert (=> b!1532664 (= e!853948 (contains!10007 (t!50268 Nil!35571) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160115 res!1049767) b!1532663))

(assert (= (and b!1532663 (not res!1049768)) b!1532664))

(declare-fun m!1415365 () Bool)

(assert (=> d!160115 m!1415365))

(declare-fun m!1415369 () Bool)

(assert (=> d!160115 m!1415369))

(declare-fun m!1415373 () Bool)

(assert (=> b!1532664 m!1415373))

(assert (=> b!1532596 d!160115))

(declare-fun d!160129 () Bool)

(assert (=> d!160129 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130634 d!160129))

(declare-fun d!160145 () Bool)

(assert (=> d!160145 (= (array_inv!38128 a!2792) (bvsge (size!49650 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130634 d!160145))

(declare-fun d!160147 () Bool)

(assert (=> d!160147 (= (validKeyInArray!0 (select (arr!49100 a!2792) j!64)) (and (not (= (select (arr!49100 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49100 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532597 d!160147))

(declare-fun d!160149 () Bool)

(declare-fun lt!663713 () Bool)

(assert (=> d!160149 (= lt!663713 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!791 Nil!35571)))))

(declare-fun e!853974 () Bool)

(assert (=> d!160149 (= lt!663713 e!853974)))

(declare-fun res!1049787 () Bool)

(assert (=> d!160149 (=> (not res!1049787) (not e!853974))))

(assert (=> d!160149 (= res!1049787 (is-Cons!35570 Nil!35571))))

(assert (=> d!160149 (= (contains!10007 Nil!35571 #b1000000000000000000000000000000000000000000000000000000000000000) lt!663713)))

(declare-fun b!1532693 () Bool)

(declare-fun e!853973 () Bool)

(assert (=> b!1532693 (= e!853974 e!853973)))

(declare-fun res!1049788 () Bool)

(assert (=> b!1532693 (=> res!1049788 e!853973)))

(assert (=> b!1532693 (= res!1049788 (= (h!37015 Nil!35571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532694 () Bool)

(assert (=> b!1532694 (= e!853973 (contains!10007 (t!50268 Nil!35571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160149 res!1049787) b!1532693))

(assert (= (and b!1532693 (not res!1049788)) b!1532694))

(assert (=> d!160149 m!1415365))

(declare-fun m!1415393 () Bool)

(assert (=> d!160149 m!1415393))

(declare-fun m!1415395 () Bool)

(assert (=> b!1532694 m!1415395))

